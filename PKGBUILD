# Maintainer: mattski <redmattski at gmail dot com>
# Maintainer: Winux <winux@winux.cc>

pkgname=python-audible
_name=${pkgname#python-}; _name=${_name^}
pkgver=0.10.0
pkgrel=1
pkgdesc=' A(Sync) Interface for internal Audible API written in pure Python.'
arch=(any)
url=https://github.com/mkb79/audible
license=(AGPL3)
depends=(python python-beautifulsoup4 python-httpx python-pbkdf2 python-pillow python-pyaes python-rsa python-questionary)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a993262970d0f10350a8ed46788b577826414c27c1c2556906eb6f334e5eadb8')

build() {
    cd $srcdir/${_name}-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $srcdir/${_name}-$pkgver
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

