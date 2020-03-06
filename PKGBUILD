# Maintainer: 3ED <krzysztofas ..at.. protonmail>
pkgname=bsed
pkgver=0.2.5
pkgrel=1
pkgdesc="a text processing tool similar to sed/grep/AWK/Perl but with SQL-like syntax"
arch=('any')
url="https://pypi.org/project/bsed/"
license=('MIT')
depends=('python' 'perl' 'python-argcomplete')
makedepends=('python-setuptools')
source=("bsed-${pkgver}.tar.gz::https://github.com/andrewbihl/bsed/archive/${pkgver}.tar.gz")
sha256sums=('dee2c66a2b4bc7c4033602374167022139a02f85122e06a75bdf28143d96a68c')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	python run_tests
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build;
}
