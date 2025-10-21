# Maintainer: steeltitanium <steeltitanium1 at gmail dot com>
# Contributor: X0rg

pkgname=obs-service-set_version
pkgver=0.6.6
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
sha512sums=('af3f42e9205e3b2cab2b8605da476f81af2415a504ab36566447bcecc632fe3fedb9da19f9a73adc293cfaf4f052b9b06e8adde7fbce285542e82ca862216635')

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make test
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}
