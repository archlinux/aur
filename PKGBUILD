# Maintainer: Qiu Wenbo <crab2313 at gmail dot com>

pkgname=switch-tools
pkgver=1.7.0
pkgrel=2
pkgdesc="Helper tools for Switch homebrew development"
arch=('x86_64')
url="https://github.com/switchbrew/switch-tools"
license=('custom:ISC')

source=("https://github.com/switchbrew/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('919a82df4301dc22e21b41233b57b8ee3e20f2089d7cf21cffc94402eba5393e')

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
