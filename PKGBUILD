# Maintainer: Colin Woodbury <colin@fosskers.ca>

pkgname=fortls
pkgver=2.13.0
pkgrel=2
pkgdesc="A modern Language Server for Fortran."
arch=(any)
url="https://github.com/gnikit/fortls"
license=("MIT")
depends=("python-setuptools")
provides=("fortran-language-server")
conflicts=("fortran-language-server")
source=("https://github.com/gnikit/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c6973826d60fb92facf3ce4595fce2f5e77c638ced3751e3eb648e23e7a40495')

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
