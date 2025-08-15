# Maintainer: SummerBreeze630 <xzwf2003 AT 163 DOT com>

pkgname=magic-cpp
pkgver=r37.3a2c23c
pkgrel=1
pkgdesc="Header-only C++ library (type visualization, struct/enum reflection)"
arch=('any')
url="https://github.com/16bit-ykiko/magic-cpp"
license=('MIT')
depends=()
makedepends=()
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d "${pkgdir}/usr/include"
    cp -r ${pkgname}/include/magic "${pkgdir}/usr/include"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install "${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
