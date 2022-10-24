# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Alex Leray <alexandre@stdin.fr>

pkgname=inkscape-axidraw
pkgver=3.6.0
pkgrel=1
pkgdesc='Inkscape extension for Axidraw'
provides=('inkscape-eggbot')
conflicts=('inkscape-eggbot')
url='https://github.com/evil-mad/EggBot/'
depends=('python' 'inkscape')
license=('GPL2')
arch=('x86_64')
source=(
  "https://cdn.evilmadscientist.com/dl/ad/public/ad-ink_${pkgver//./}.zip"
)
sha256sums=(
  'dafc3528a39506a1f307dfdf6d9f92af6f67c65e1f37f92118961b32415e57d6'
)

package() {
  echo >&2 'Packaging the Inkscape extension'
	mkdir -p "${pkgdir}/usr/share/inkscape/extensions"
  cp -R --preserve=mode -T "${srcdir}/ad-ink_${pkgver//./}" \
    "${pkgdir}/usr/share/inkscape/extensions/axidraw"

  echo >&2 'Packaging the license of included SVG fonts'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/ad-ink_${pkgver//./}/svg_fonts/OFL.txt"
}
