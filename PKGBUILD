# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Antony Male <antony dot male at gmail dot com>

pkgname=pacbuilder-svn
pkgver=138
pkgrel=3
pkgdesc="A tool to massively recompile archlinux packages from sources"
arch=('any')
url="http://code.google.com/p/pacbuilder/"
license=('GPL3')
depends=('rsync')
makedepends=('subversion')
backup=('etc/pacbuilder.conf')

source=("pacbuilder::svn+http://pacbuilder.googlecode.com/svn/trunk")
md5sums=('SKIP')

pkgver() {
	cd pacbuilder

	svnversion
}

package() {
  cd pacbuilder

  make DESTDIR="$pkgdir" install
}
