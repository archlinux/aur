# Maintainer: piernov <piernov@piernov.org>
#
pkgname=python-hdf5plugin
_name=${pkgname#python-}
pkgver=6.0.0
pkgrel=1
pkgdesc="Set of compression filters for h5py"
arch=('any')
url="https://github.com/silx-kit/hdf5plugin"
license=('MIT')
depends=('python' 'python-h5py')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-py-cpuinfo')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('847ed9e96b451367a110f0ba64a3b260d38d64bbf3f25751858d3b56e094cfe0')

build() {
  cd "${_name//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
