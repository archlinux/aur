# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=asmttpd
pkgver=0.4.4
pkgrel=1
pkgdesc='Web server written in Assembly'
arch=('x86_64')
url='https://github.com/nemasu/asmttpd'
license=('GPL2')
makedepends=('yasm')
source=("asmttpd-${pkgver}.tar.gz::https://github.com/nemasu/asmttpd/archive/${pkgver}.tar.gz")
sha512sums=('8419b095fa9fa89979cef512c28cbf9001bc8f47c4d816a989e20d4b5338afa08443ece22d0576ed8463a966469a0207caec5dcac003c63a952bb7e780e9bccf')

build() {
  cd "${pkgname}-${pkgver}"

  make -s release
}

package() {
  install -Dm755 "${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
