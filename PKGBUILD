# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=fortran-language-server
pkgver=1.9.0
pkgrel=1
pkgdesc="Fortran Language Server for the Language Server Protocol"
arch=(any)
url="https://github.com/hansec/fortran-language-server"
license=('MIT')
depends=(python-argparse python-future)
makedepends=(python-setuptools)
source=("https://github.com/hansec/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6656190a73a1775f5bd289fce7c59da399e661d19fabea5a0ed13f3753f21ffd')

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
