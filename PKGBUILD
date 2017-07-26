# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=faad2-git
pkgver=2.8.1.r5.g8d04544
pkgrel=1
pkgdesc="Freeware Advanced Audio (AAC) Decoder"
arch=('i686' 'x86_64')
url="http://faac.sourceforge.net/"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('faad2')
conflicts=('faad2')
source=("git+https://git.code.sf.net/p/faac/faad2")
sha256sums=('SKIP')


pkgver() {
  cd "faad2"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

build() {
  cd "faad2"

  ./bootstrap
  ./configure --prefix="/usr"
  make
}

package() {
  cd "faad2"

  make DESTDIR="$pkgdir" install
}
