# Maintainer: Tariel <tarielz@hotmail.com>

_pkgname=ttf-terrywang-typewriter-fonts
pkgname=${_pkgname}-git
pkgver=r2.0f49da5
pkgrel=1
pkgdesc="Chinese typewriter/mimeograph style fonts by Terry Wang (https://huozi.cool/)."
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
