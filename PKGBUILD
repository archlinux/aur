# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-spotui
pkgver=0.1.20
pkgrel=1
pkgdesc="TUI Spotify client written in Python"
arch=('any')
url="https://github.com/ceuk/spotui"
license=('MIT')
depends=('python' 'python-spotipy')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8a545a950259ddfd2fd9601de5d37bcc9a50e8a2c8c102cd1f4bf562105c7e5a')

build() {
	cd "spotui-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "spotui-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
