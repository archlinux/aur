# Maintainer: Ghassan Alduraibi <git@ghassan.dev>

pkgname=python-jax-jumpy
_name=${pkgname#python-}
pkgver=0.2.0
pkgrel=1
pkgdesc="On-the-fly conversions between Jax and NumPy tensors"
arch=('any')
url="https://github.com/Farama-Foundation/Jumpy"
license=('Apache')
depends=('python-numpy')
optdepends=('python-jax' 'python-jaxlib')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
b2sums=('b9e9737455d167d0e700f543e2fef0e7f01f18a0d8bc0d29a9ab660a5dbe390aeeb5df0cf2a2da01ca6198900b38a23a5a4a6ccc5f90f37a4a9df383123804a0')

build() {
    cd "${_name//-/_}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name//-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
