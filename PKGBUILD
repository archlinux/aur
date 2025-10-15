# Maintainer: Qiu Wenbo <crab2313 at gmail dot com>

pkgname=switch-tools
pkgver=1.13.1
pkgrel=1
pkgdesc="Helper tools for Switch homebrew development"
arch=('x86_64')
url="https://github.com/switchbrew/switch-tools"
license=('custom:ISC')

source=("https://github.com/switchbrew/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('858d5c286309ca7add47ded473779e6c9a00b24febf83516df86c44d8b744eb2')

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
