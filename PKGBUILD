# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Alex Leray <alexandre@stdin.fr>

pkgname=inkscape-axidraw-bin
pkgver=3.9.1
pkgrel=1
pkgdesc='Inkscape extension for Axidraw'
provides=('inkscape-axidraw' 'inkscape-eggbot')
conflicts=('inkscape-axidraw' 'inkscape-eggbot')
url='https://wiki.evilmadscientist.com/Axidraw_Software_Installation#Linux'
depends=('python' 'inkscape')
license=('GPL2')
arch=('x86_64')
source=(
  "https://cdn.evilmadscientist.com/dl/ad/public/${pkgver//./}/ad-ink_lin-x86_${pkgver//./}.zip"
)
sha256sums=(
  '59eeee3db3fefffdbdbfe9ddd6cf718bc2ceede1a8f1f49688130b8c383e4043'
)

package() {
  echo >&2 'Packaging the Inkscape extension'
  mkdir -p "${pkgdir}/usr/share/inkscape/extensions"
  cp -R --preserve=mode -T "${srcdir}/ad-ink_lin-x86_${pkgver//./}" \
    "${pkgdir}/usr/share/inkscape/extensions/axidraw"

  echo >&2 'Packaging the license of included SVG fonts'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/ad-ink_lin-x86_${pkgver//./}/svg_fonts/OFL.txt"
}
