# Maintainer: Radek Podgorny <radek@podgorny.cz>
pkgname=rcswitch-pi-git
pkgver=r10.1c4e20f
pkgrel=1
pkgdesc="rapberry pi library for rc controlled outlets"
arch=('armv6h')
url="https://github.com/rpodgorny/rcswitch-pi"
license=('GPL')
depends=('wiringpi')
provides=('rcswitch-pi')
conflicts=('rcswitch-pi')
source=('git+https://github.com/rpodgorny/rcswitch-pi.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/rcswitch-pi"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/rcswitch-pi"
  #./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/rcswitch-pi"
  make DESTDIR="$pkgdir/" install
}
