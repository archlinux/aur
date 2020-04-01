# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=fortran-language-server
pkgver=1.11.0
pkgrel=1
pkgdesc="Fortran Language Server for the Language Server Protocol"
arch=(any)
url="https://github.com/hansec/fortran-language-server"
license=('MIT')
depends=(python-argparse python-future python-setuptools)
source=("https://github.com/hansec/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2ca29e432264d5cdc18e1cf983c177e70091e8e52b7ba80a26f9dd45f30f8fae')

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
