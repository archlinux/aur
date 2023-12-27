# Maintainer: steeltitanium <steeltitanium1 at gmail dot com>
# Contributor: X0rg

pkgname=obs-service-set_version
pkgver=0.6.2
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
sha512sums=('d3fdc776785736a4e1d12318d781a007398d6fa7401a806d89827fed81e6285bbf3b8ea89284785435760cbc323ee01b862e13b6d3185d0e5e1de68e704ead9d')

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make test
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}
