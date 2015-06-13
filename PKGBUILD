# Maintainer: alastair pharo  asppsa at gmail dot com
# Contributor: Bjoern Lindig bjoern _dot_ lindig _at_ googlemail _dot_ com

pkgname=pure-odbc
pkgver=0.10
pkgrel=1
pkgdesc="A Pure module to access to all ODBC-capable databases"
arch=("i686" "x86_64")
license=('LGPL3')
url="http://purelang.bitbucket.org/"
depends=('pure' 'unixodbc')
makedepends=()
groups=(pure-complete pure-web)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
sha1sums=('5e915c26d9584f84efd2b8e92d2c7811cf2ab952')

build() {
	cd $srcdir/$pkgname-$pkgver
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install || return 1
}

