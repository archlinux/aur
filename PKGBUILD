# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=hexabyte
pkgver=0.8.3
pkgrel=1
pkgdesc='A modern, modular, and robust TUI hex editor'
arch=('any')
url='https://github.com/thetacom/hexabyte'
license=('GPL3')
depends=('python-hilbertcurve' 'python-linkify-it-py' 'python-munch' 'python-textual' 'python-toml')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('3379e2638629efb1f785dd85e8d38ec2b9dd41fd51db57bfd698375091d722bb')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
