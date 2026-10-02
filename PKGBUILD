# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-github-dlr
pkgver=0.1.3
pkgrel=1
pkgdesc="Download individual files and folders from GitHub recursively"
arch=('any')
url="https://github.com/rocktimsaikia/github-dlr"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-alive-progress' 'python-emoji')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('730443300cb643548bace642fa5a665ffbb46c335228088b811fe5b26883ca7b')

build() {
	cd "github-dlr-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "github-dlr-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
