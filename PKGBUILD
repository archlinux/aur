# Contributor: gucong <gucong43216@gmail.com>
pkgname=ibus-table-taiji
_gitname="ibus-table-taiji"
pkgver=dea5565
pkgrel=1
pkgdesc="The Taiji (Chinese) Input Method for IBus Table"
arch=('i686' 'x86_64')
url="http://tjm.taiji1.com/tjminput/index.htm"
license=('GPL')
depends=('ibus-table')
makedepends=('git')
source=(git+http://github.com/microcai/ibus-table-taiji.git)
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always
}

build() {
  cd $_gitname
  ./autogen.sh
  ./configure --prefix=/usr --libexecdir=/usr/lib/ibus
  make
} 

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
}
