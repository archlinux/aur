# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-pdiary
pkgver=1.65
pkgrel=1
pkgdesc="A simple terminal diary journal application written in Python with encryption support"
arch=('any')
url="https://github.com/manipuladordedados/pdiary"
license=('GPL-3.0-only')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c28b6bf5e1f5ece56a3a00f7cf018d6385fe7c496f015944bea1b45c2eb3b195')

build() {
	cd "pdiary-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "pdiary-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
