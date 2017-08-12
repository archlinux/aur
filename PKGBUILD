# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=multicat-git
pkgver=2.2.r7.g105d45f
pkgrel=1
pkgdesc="Easily and efficiently manipulate multicast streams"
arch=('i686' 'x86_64')
url="https://www.videolan.org/projects/multicat.html"
license=('GPL2')
depends=('glibc')
makedepends=('git' 'bitstream')
provides=('multicat')
conflicts=('multicat')
source=("git+https://code.videolan.org/videolan/multicat.git")
sha256sums=('SKIP')


pkgver() {
  cd "multicat"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "multicat"

  make
}

package() {
  cd "multicat"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
