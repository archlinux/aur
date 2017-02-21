# Maintainer: Peter Lamby <peterlamby@web.de>
pkgname=deadbeef-opus-git
pkgver=0.6.r2.g330e3a3
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
