# Maintainer: Joachim Desroches <joachim.desroches@epfl.ch>

pkgname=sintl
pkgver=0.2.11
pkgrel=1
pkgdesc='A tool for translating HTML5 web pages.'
arch=('any')
url='https://kristaps.bsd.lv/sintl/'
license=('custom')
depends=('expat')
source=('https://kristaps.bsd.lv/sintl/snapshots/sintl.tar.gz')
sha512sums=('5a22cd8266568798d6f045dcce47bd0e1c0949ab8515a1a08f616435eae0042dc941a2c995d3a90d43537dbfa50eaab6845ce4faa0d85f93b4dbfebe2bb547e9')

build()
{
	cd "$pkgname-$pkgver"
	./configure PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man"
	make
}

check()
{
	cd "$pkgname-$pkgver"
	make regress
}

package()
{
	cd "$pkgname-$pkgver"
	make install
	# install license file whenever it is added.
}
