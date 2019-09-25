# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=fortran-language-server
pkgver=1.10.3
pkgrel=1
pkgdesc="Fortran Language Server for the Language Server Protocol"
arch=(any)
url="https://github.com/hansec/fortran-language-server"
license=('MIT')
depends=(python-argparse python-future python-setuptools)
source=("https://github.com/hansec/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('caaf8774894990e166bce24e3fae9d90f4c80f6152b46c11042ebfd345876709')

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
