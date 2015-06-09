# Maintainer: Nicolas Quiénot < niQo at aur >

pkgname=libkqueue
pkgver=2.0.3
pkgrel=2
pkgdesc="userspace implementation of the kqueue kernel event notification mechanism found in FreeBSD and other BSD-based"
url="https://github.com/mheily/libkqueue"
arch=('i686' 'x86_64')
license=('BSD')
depends=('glibc')
makedepends=('gcc')
options=('!libtool')
source=(https://github.com/mheily/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('42d405a26c36f734e2c7d3a936e30abe')

build() {
  cd "$pkgname-$pkgver"
#  CFLAGS='-fPIC -I./include -I./src/common -Wall -Werror' ./configure --prefix=/usr || return 1
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
#  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

