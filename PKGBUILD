# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-sqliteproof
pkgver=0.1.0
pkgrel=1
pkgdesc="Recover what survived a corrupt SQLite database: intact tables, lost rows, safe exports"
arch=('any')
url="https://github.com/OrbitalKeyAi/sqliteproof"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5c55198dd1ef2d4dee1dd5b1f143fdd7cc93cb537250668fec3664f7c22cd35e')

build() {
	cd "sqliteproof-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "sqliteproof-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
