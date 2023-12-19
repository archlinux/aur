# Maintainer: Qiu Wenbo <crab2313 at gmail dot com>

pkgname=switch-tools
pkgver=1.12.0
pkgrel=1
pkgdesc="Helper tools for Switch homebrew development"
arch=('x86_64')
url="https://github.com/switchbrew/switch-tools"
license=('custom:ISC')

source=("https://github.com/switchbrew/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('460b19fb3f597db584cefc3be0c08ebf61d26c3e342eea0b61da727e67ad60d6')

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
