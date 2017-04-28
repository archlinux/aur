# Maintainer: John "ShaggyTwoDope" Jenkins <twodopeshaggy at gmail dot com>
pkgname=ppastats
pkgver=1.3.3
pkgrel=1
pkgdesc="A command line tool generates download statistics of an Ubuntu PPA"
arch=('i686' 'x86_64')
url="https://wpitchoune.net/ppastats/"
license=('GPL2')
depends=('json-c' 'curl')
makedepends=('automake' 'autoconf' 'help2man')
source=(https://wpitchoune.net/ppastats/files/$pkgname-$pkgver.tar.gz)
md5sums=('47db9a3b20e6dd9694cd3e4b8e462b19')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
