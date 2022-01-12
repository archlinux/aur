# Maintainer: Luke Featherston <lukefeatherston at gmail dot com>
_pkgname=siji
pkgname="${_pkgname}-ttf"
pkgver=r22.14e7da9
pkgrel=1
pkgdesc='Siji bitmap font with scalable ttf version'
provides=("${_pkgname}")
conflicts=("${_pkgname}")
arch=('any')
url="https://github.com/fauno/${_pkgname}"
license=('GPLv2')
depends=('fontconfig' 'xorg-mkfontscale' 'xorg-xset')
optdepends=('xorg-xfd: use view.sh script to view glyphs' 'font-manager: alternate way to view glyphs')
makedepends=('git')
source=("${pkgname}::git+https://github.com/fauno/siji")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -D -m644 ttf/${_pkgname}.ttf "${pkgdir}/usr/share/fonts/misc/${_pkgname}.ttf"
  install -D -m644 bdf/${_pkgname}.bdf "${pkgdir}/usr/share/fonts/misc/${_pkgname}.bdf"
  install -D -m755 view.sh "${pkgdir}/usr/share/${_pkgname}/view.sh"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
