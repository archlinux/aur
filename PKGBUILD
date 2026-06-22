# Maintainer: Tariel <tarielz@hotmail.com>

_pkgname=ttf-terrywang-hot-metal-fonts
pkgname=${_pkgname}-git
pkgver=r2.d4177de
pkgrel=1
pkgdesc="Hot-metal typesetting style Chinese fonts by Terry Wang (https://huozi.cool/)."
arch=(any)
license=("custom:terrywang-font-license")
makedepends=('git')

url="https://github.com/BH1PHL/${_pkgname}"
source=(git+${url}.git)
sha1sums=('SKIP')


pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

package() {
  install -d "${pkgdir}/usr/share/fonts/${_pkgname}"
  install -m644 ${srcdir}/${_pkgname}/*.ttf "${pkgdir}/usr/share/fonts/${_pkgname}/"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
