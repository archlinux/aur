# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lizard-git
pkgver=1.0.r3.g6a1ed71
pkgrel=1
pkgdesc="An efficient compressor with very fast decompression"
arch=('i686' 'x86_64')
url="https://github.com/inikep/lizard"
license=('GPL2' 'BSD')
depends=('glibc')
makedepends=('git')
provides=('lizard')
conflicts=('lizard')
source=("git+https://github.com/inikep/lizard.git")
sha256sums=('SKIP')


pkgver() {
  cd "lizard"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "lizard"

  make
}

check() {
  cd "lizard"

  #make test
}

package() {
  cd "lizard"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "lib/LICENSE" "$pkgdir/usr/share/licenses/lizard/LICENSE"
}
