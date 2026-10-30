# Maintainer: Joel Niemelä <joel@niemela.se>
pkgname=python-checktestdata
pkgver=2026.9.2
pkgrel=1
pkgdesc="Python reimplementation of the DOMjudge checktestdata input validation tool"
arch=('any')
url="https://github.com/mzuenni/pyctd"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-versioningit')
source=("https://pypi.org/packages/source/c/checktestdata/checktestdata-${pkgver}.tar.gz")
sha256sums=('3f7f59f5ea4d675ff2520f930a506ac6b5063e6a74d7356e9b8e61960bd4cab3')

build() {
	cd "checktestdata-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "checktestdata-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
