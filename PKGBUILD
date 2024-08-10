# Maintainer: Pablo Hernandez-Cerdan <pablo.hernandez.cerdan@outlook.com>
pkgname=python-poetry-plugin-sync-pre-commit-lock
_name=sync-pre-commit-lock
pkgver=0.6.1
pkgrel=1
pkgdesc="Sync pre-commit lock file across multiple repositories"
arch=('any')
url="https://github.com/GabDug/sync-pre-commit-lock"
license=('GPL3')
depends=('python')
makedepends=(python-build python-installer python-wheel python-pdm-backend)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1bb7cbcabcb6a5f08a75d9b82d8cf45143e7326d7c1329116698d82df5f7dcca')

build() {
    cd "$_name-$pkgver"
    export PDM_BUILD_SCM_VERSION=$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: ts=2 sw=2 et:
