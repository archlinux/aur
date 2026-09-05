# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-json-leaves
_pkgname=json-leaves
pkgver=1.2.2
pkgrel=1
pkgdesc="Extract the leaves from a JSON file and show the paths to them"
arch=('any')
url="https://github.com/talwrii/json-leaves"
license=('unknown')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
_tag="1.2.2"
_srcdir="json-leaves-1.2.2"
source=("$_pkgname-$pkgver.tar.gz::https://codeload.github.com/talwrii/json-leaves/tar.gz/refs/tags/$_tag")
sha256sums=('b841079d509679455c26dd971cbdac33fa84e6f043f7cce21aeef1cc5d4488d4')

build() {
	cd "$_srcdir"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	fi
}
