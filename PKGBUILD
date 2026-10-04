# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-posce
_pkgname=posce
pkgver=0.4.0
pkgrel=2
pkgdesc="A note-taking toolkit for your command line"
arch=('any')
url="https://github.com/vdt/posce"
license=('BSD')
depends=('python' 'python-click' 'python-pyperclip' 'python-send2trash')
makedepends=('python-build' 'python-installer' 'python-wheel')
_tag="0.4.0"
_srcdir="posce-0.4.0"
source=("$_pkgname-$pkgver.tar.gz::https://codeload.github.com/vdt/posce/tar.gz/refs/tags/$_tag")
sha256sums=('d9744f698f70de4e0fbf13aaf84423fb5249f401b5cad1d5dddcce54fbefc4c9')

build() {
	cd "$_srcdir"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 readme.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	install -Dm644 changes.md "$pkgdir/usr/share/doc/$_pkgname/changes.md"
	install -Dm644 license.md "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
