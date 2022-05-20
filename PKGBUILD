# Maintainer: Colin Woodbury <colin@fosskers.ca>

pkgname=fortls
pkgver=2.6.0
pkgrel=1
pkgdesc="A modern Language Server for Fortran."
arch=(any)
url="https://github.com/gnikit/fortls"
license=("MIT")
depends=("python-setuptools")
provides=("fortran-language-server")
conflicts=("fortran-language-server")
source=("https://github.com/gnikit/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('61fddb57de1dee190b61674827d1f3d9d3a6338da7c0c4e83acd94f47400f219')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	# License
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
