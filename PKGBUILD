# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lua-stdlib
pkgver=41.1.1
pkgrel=1
pkgdesc='Standard library for Lua'
arch=('any' 'x86_64')
url="http://github.com/$pkgname/$pkgname"
license=('MIT')
depends=('lua')
source=("http://github.com/$pkgname/$pkgname/archive/release-v$pkgver.zip")
md5sums=('01182a1858336e8d927eee83641ee711')

build() {
  cd $pkgname-release-v$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-release-v$pkgver
  make DESTDIR=$pkgdir install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

