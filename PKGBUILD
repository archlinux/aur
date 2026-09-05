# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-maestro-cli
_pkgname=maestro-cli
pkgver=2.0.5
pkgrel=1
pkgdesc="Play songs (or any audio) in the terminal, feature-full music player"
arch=('any')
url="https://github.com/PrajwalVandana/maestro-cli"
license=('custom')
depends=('python' 'python-mpv' 'mpv' 'python-mutagen' 'python-requests' 'youtube-dl')
makedepends=('python-build' 'python-installer' 'python-wheel')
_tag="2.0.5"
_srcdir="maestro-cli-2.0.5"
source=("$_pkgname-$pkgver.tar.gz::https://codeload.github.com/PrajwalVandana/maestro-cli/tar.gz/refs/tags/$_tag")
sha256sums=('a7a0952235dc21afb33f0d0da3623ac42f6d46dab4fbf08d1917f7ac51e70d36')

build() {
	cd "$_srcdir"
	rm -rf dist
	python -m build --wheel --no-isolation
}

package() {
	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
