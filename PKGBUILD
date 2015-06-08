# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Linus Sjögren <thelinx@unreliablepollution.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname=Lake
pkgname=lake-git
pkgver=1.4.1.r2.g065ac45
pkgrel=1
pkgdesc="Lua-based Build Tool"
arch=('any')
url="https://github.com/stevedonovan/Lake"
license=('MIT')
depends=('lua-filesystem')
makedepends=('git')
provides=('lake')
conflicts=('lake')
source=("git://github.com/stevedonovan/Lake.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm0775 lake $pkgdir/usr/bin/lake
  install -d $pkgdir/usr/share/doc/$pkgname
  install -Dm0664 doc/* $pkgdir/usr/share/doc/$pkgname
}
