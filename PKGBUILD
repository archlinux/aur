# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=axisfix-git
_pkgname=axisfix
pkgver=r5.f47040e
pkgrel=1
pkgdesc="linux-based tool to fix the Axis problem caused by PlayStation-USB adapters"
url="https://github.com/leoagomes/axisfix"
depends=('glibc')
makedepends=('git')
conflicts=(axisfix)
license=('MIT')
arch=('x86_64' 'i686')
source=("${pkgname}"::'git+https://github.com/leoagomes/axisfix.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${pkgname}
  make
}

package() {
  install -Dm755 "${srcdir}/${pkgname}/axisfix" "${pkgdir}/usr/bin/axisfix"
  install -Dm644 "${srcdir}/${pkgname}/README.md" "${pkgdir}/usr/share/doc/axisfix/README.md"
}

# vim:set ts=2 sw=2 et:
