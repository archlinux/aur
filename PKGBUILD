# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=specl  
pkgver=12
pkgrel=1
pkgdesc="testing tool for Lua, providing a Behaviour Driven Development framework in the vein of RSpec"
url="http://gvvaughan.github.io/specl/"
arch=('any')
license=('GPL')
depends=('bash' 'lua' 'lua-yaml-git')
source=(https://github.com/gvvaughan/specl/archive/release-v$pkgver.tar.gz)
md5sums=('80c9b9c32d36477bb0df892937b83990')

build() {
  cd $srcdir/$pkgname-release-v$pkgver
  ./configure --prefix=/usr
  make 
}
package() {
  cd $srcdir/$pkgname-release-v$pkgver
  make DESTDIR=$pkgdir install
}
