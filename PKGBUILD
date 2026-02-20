# Maintainer: mattski <redmattski at gmail dot com>
# Maintainer: Winux <winux@winux.cc>

pkgname=python-audible-cli
_name=${pkgname#python-}
pkgver=0.3.3
pkgrel=1
pkgdesc='A command line interface for audible package. With the cli you can download your Audible books, cover, chapter files.'
arch=(any)
url=https://github.com/mkb79/audible-cli
license=(AGPL3)
depends=('python' 'python-aiofiles' 'python-audible' 'python-click' 'python-httpx' 'python-packaging' 'python-pillow' 'python-questionary' 'python-tabulate' 'python-toml' 'python-tqdm')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fdfe6859abf797f1e1995de8830f400b6e2fb1dead26e374362b4efc997fc594')

build() {
    cd $srcdir/${_name}-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $srcdir/${_name}-$pkgver
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
