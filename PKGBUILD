# For ArchLinux by Joel Porquet

pkgname=dtc-git
pkgrel=1
pkgver=1.4.1.r16.ge5e6df7
pkgdesc='Device Tree Compiler'
arch=(i686 x86_64)
license=(GPL2)
makedepends=(git)
conflicts=(dtc)
replaces=(dtc)
provides=(dtc)
url='http://jdl.com/software/'
source=(git://git.kernel.org/pub/scm/utils/dtc/dtc.git)
md5sums=('SKIP')

pkgver() {
  cd dtc
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd dtc
  make
}

package() {
  cd dtc
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
