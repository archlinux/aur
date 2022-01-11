# Maintainer: Luke Featherston <lukefeatherston at gmail dot com>
_pkgname=siji
pkgname="${_pkgname}-ttf"
pkgver=r22.14e7da9
pkgrel=1
pkgdesc='Iconic bitmap with scalable ttf version'
conflicts=("${_pkgname}")
arch=('any')
url="https://github.com/fauno/${_pkgname}"
license=('GPLv2')
depends=('fontconfig' 'xorg-mkfontscale' 'xorg-xset')
optdepends=('xorg-xfd: use view.sh script to view glyphs' 'font-manager: alternate way to view glyphs')
makedepends=('git')
source=("${pkgname}::git+https://github.com/fauno/siji")
sha512sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}"
  install -D -m644 ttf/${_pkgname}.ttf "${pkgdir}/usr/share/fonts/misc/siji.ttf"
  install -D -m644 bdf/siji.bdf "${pkgdir}/usr/share/fonts/misc/siji.bdf"
  install -D -m755 view.sh "${pkgdir}/usr/share/${_pkgname}/view.sh"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
