# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=hexabyte
pkgver=0.8.7
pkgrel=1
pkgdesc='A modern, modular, and robust TUI hex editor'
arch=('any')
url='https://github.com/thetacom/hexabyte'
license=('GPL3')
depends=('python-hilbertcurve' 'python-linkify-it-py' 'python-munch' 'python-textual' 'python-toml')
makedepends=('python-poetry' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('4f9b4b15cf2eac0db276110cee4b7462d617c3cf57234c33d8e3de4bd37db251')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
