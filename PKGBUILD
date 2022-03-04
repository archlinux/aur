# Maintainer: Colin Woodbury <colin@fosskers.ca>

pkgname=fortls
pkgver=2.2.4
pkgrel=1
pkgdesc="A modern Language Server for Fortran."
arch=(any)
url="https://github.com/gnikit/fortls"
license=("MIT")
depends=("python-setuptools")
provides=("fortran-language-server")
conflicts=("fortran-language-server")
source=("https://github.com/gnikit/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2408bdacc7f638776721430716b7b82952c399adce0bfa139dd66a3e7bc42856')

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
