# Maintainer: willemw <willemw12@gmail.com>
# Contibutor: gnomeye <gnomeye at gmail dot com>

_name=ts
pkgname=task-spooler
pkgver=1.0
pkgrel=1
pkgdesc="Queue up tasks from the shell for batch execution"
arch=('i686' 'x86_64')
url="http://vicerveza.homeunix.net/~viric/soft/ts/"
license=('GPL')
source=(http://vicerveza.homeunix.net/~viric/soft/$_name/$_name-$pkgver.tar.gz)
md5sums=('c7589cdc28115d8925794d713ff72dba')

build() {
  cd $_name-$pkgver
  make
}

package() {
  cd $_name-$pkgver
  #make PREFIX="$pkgdir/" install
  install -Dm755 ts "$pkgdir/usr/bin/tsp"
  install -Dm644 ts.1 "$pkgdir/usr/share/man/man1/tsp.1"
}

