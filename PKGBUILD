# Maintainer: steeltitanium <steeltitanium1 at gmail dot com>
# Contributor: X0rg

pkgname=obs-service-set_version
pkgver=0.6.4
pkgrel=1
pkgdesc="Version Service for the OpenSUSE Build Service (OBS)"
arch=('any')
url="https://github.com/openSUSE/obs-service-set_version"
license=('GPL2')
groups=('obs')
depends=('obs-build'
	'python-packaging')
checkdepends=('flake8'
	'python-ddt')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openSUSE/obs-service-set_version/archive/$pkgver.tar.gz")
sha512sums=('7f9e0d7e55db84dfa684d368cd93e7544b34ee172dcecfedb5f067732944ae9eb0185c522904cb00a0404299c9a9986baea63487ce3b7e71c5ec92a51cca226f')

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make test
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}
