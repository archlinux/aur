# Maintainer: Johannes Dewender  arch at JonnyJD dot net
pkgname=coverity-submit
pkgver=1.17
pkgrel=1
pkgdesc="Submitting Coverity builds"
arch=('any')
url="http://www.catb.org/esr/coverity-submit/"
license=('BSD')
depends=('python' 'curl')
optdepends=('cov-analysis: available after login at coverity')
makedepends=('pychecker')
source=(http://www.catb.org/~esr/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('513c97c376542cae7560a9be3ee29dc1')

#build() {
#	cd "$srcdir/$pkgname-$pkgver"
	# make build builds the man page, which doesn't work for unknown reasons
#}

#check() {
#	cd "$srcdir/$pkgname-$pkgver"
#	make pychecker
#}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D coverity-submit $pkgdir/usr/bin/coverity-submit
	install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
