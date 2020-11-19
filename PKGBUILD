# Maintainer: willemw <willemw12@gmail.com>
# Contributor: gnomeye <gnomeye at gmail dot com>

_srcname=ts
pkgname=task-spooler
pkgver=1.0
pkgrel=3
pkgdesc="Queue up tasks from the shell for batch execution"
arch=('x86_64')
url="http://vicerveza.homeunix.net/~viric/soft/ts/"
license=('GPL')
#source=(http://vicerveza.homeunix.net/~viric/soft/$_srcname/$_srcname-$pkgver.tar.gz)
source=(http://ftp.debian.org/debian/pool/main/t/task-spooler/task-spooler_1.0.orig.tar.gz)
md5sums=('c7589cdc28115d8925794d713ff72dba')

build() {
  cd $_srcname-$pkgver
  make
}

package() {
  cd $_srcname-$pkgver

  #make PREFIX="$pkgdir/" install

  install -dm755 "$pkgdir/usr/share/man/man1"
  gzip ts.1 > "$pkgdir/usr/share/man/man1/tsp.1.gz"

  install -Dm755 ts "$pkgdir/usr/bin/tsp"
  install -Dm644 TRICKS "$pkgdir/usr/share/doc/$pkgname/TRICKS"
}

