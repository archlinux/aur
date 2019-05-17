# Maintainer: László Várady <laszlo.varady93@gmail.com>

pkgname=ivykis
pkgver=0.42.4
pkgrel=1
pkgdesc="Asynchronous I/O readiness notification library"
arch=('x86_64')
url="https://github.com/buytenh/ivykis"
license=('LGPL2.1')
conflicts=('libivykis' 'libivykis-git')
source=("https://downloads.sourceforge.net/project/lib$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6ef8ed255814e5068473356877da55d67493eeafd978884cdecc5a3e58067129')

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
