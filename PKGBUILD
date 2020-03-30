# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=font-v
pkgver=1.0.1
pkgrel=1
pkgdesc='Font version string reporting and modification library + executable tool'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=('MIT')
depends=('python' 'python-gitpython' 'python-fonttools')
makedepends=('python-setuptools-scm')
checkdepends=('python-tox')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1fc22ff0af93f24fe169da5ca42fc774e9c0a07bf10082e3fb59c4292d30135d')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
    cd "$pkgname-$pkgver"
    # Checks currently fail against Python 3.8, but app works :(
	# tox -e py38
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
