# Contributor: Peter Lamby <peterlamby@web.de>
# Maintainer: C. N. Hsing
pkgname=deadbeef-opus-git
pkgver=0.8.r1.gfd9333b
pkgrel=1
pkgdesc="opus plugin for the DeaDBeeF music player"
arch=('i686' 'x86_64')
url="https://bitbucket.org/Lithopsian/deadbeef-opus"
license=('GPL2')
provides=(deadbeef-opus)
conflicts=(deadbeef-opus)
depends=('deadbeef' 'opusfile')
makedepends=('git')
source=('git+https://bitbucket.org/Lithopsian/deadbeef-opus.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd ${pkgname%-git}
  make
}

package() {
  cd ${pkgname%-git}
  install -Dm755 opus.so "$pkgdir/usr/lib/deadbeef/opus.so"
}
