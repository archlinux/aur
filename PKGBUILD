# Maintainer: mattski <redmattski at gmail dot com>

pkgname=python-audible
_name=${pkgname#python-}
pkgver=0.9.1
pkgrel=2
pkgdesc='A(Sync) Interface for internal Audible API written in'
arch=(any)
url=https://github.com/mkb79/audible
license=(AGPL3)
depends=(python python-beautifulsoup4 python-httpx python-pbkdf2 python-pillow python-pyaes python-rsa python-questionary)
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('90dabef70d852224479ca1f23896f8f8e0665375a49859f26d61b605da8c1f33')

build() {
    cd $srcdir/${_name}-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $srcdir/${_name}-$pkgver
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

