pkgname=redminecli
pkgver=1.3.0
pkgrel=1
pkgdesc='Command line interface for Redmine'
arch=('any')
url=https://github.com/egegunes/redmine-cli
license=('GPL3')
depends=('python-click' 'python-colorama')
makedepends=('python-build' 'python-installer' 'python-wheel' )
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('9047d36ce60cbbc5fd8d403e7db0a30322255281988d9150fe1d76ea81e73b9c')

build() {
	cd $pkgname-$pkgver
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd $pkgname-$pkgver
}

package() {
	cd $pkgname-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
