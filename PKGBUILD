# Maintainer: Alastair Pharo <asppsa at gmail dot com>

pkgname=pure-fastcgi
pkgver=0.6
pkgrel=1
pkgdesc="Pure FastCGI interface"
arch=("i686" "x86_64")
license=('custom')
url="http://purelang.bitbucket.org/"
depends=('pure' "fcgi")
makedepends=()
groups=(pure-complete pure-web)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
sha1sums=('8a68aad2e3058a05f845fc196c8fc49fc2cc1fc1')

build() {
  cd $srcdir/$pkgname-$pkgver
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
}
