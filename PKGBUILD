# Maintainer: X0rg

pkgname=obs-service-set_version
pkgver=0.5.13
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
sha512sums=('65471e8c637037d412ef0ea0b7e8ad2b64b417f22eac7636ce6989465f3a994ee159f28a146cc925928b68be3d2f6d0560c056ec976233149d7148dabe23054a')

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make test
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}
