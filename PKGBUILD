pkgname=libfastjson-git
pkgver=1.2304.0.r5.gf1983a8
pkgrel=1
pkgdesc="A performance-focused json library for C"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/rsyslog/libfastjson"
license=('GPL')
source=(git+https://github.com/rsyslog/libfastjson)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
} 

build() {
  cd "$pkgname"
  autoreconf -fvi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
