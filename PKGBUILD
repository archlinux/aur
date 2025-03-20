# Maintainer: László Várady <laszlo.varady93@gmail.com>

pkgname=ivykis
pkgver=0.43.2
pkgrel=1
pkgdesc="Asynchronous I/O readiness notification library"
arch=('x86_64')
url="https://github.com/buytenh/ivykis"
license=('LGPL-2.1-only')
conflicts=('libivykis' 'libivykis-git')
source=("https://downloads.sourceforge.net/project/lib$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('93e3e9b237695437cd63d4aa48a8d9dfd8b39bc28a192a5770d113c4fe9099ef')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make --keep-going check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
