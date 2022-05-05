# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-rosbags
pkgver=0.9.10
pkgrel=1
pkgdesc='Pure Python library to read, modify, convert, and write rosbag files.'
arch=(any)
url='https://gitlab.com/ternaris/rosbags'
license=('Apache-2.0')
depends=('python' 'python-lz4' 'python-numpy' 'python-ruamel-yaml' 'python-zstandard')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver::https://files.pythonhosted.org/packages/53/46/1ba8845d091f9b15be0dbe8c8a5b641ca0473d00a228fb7d1bae4f9a6c62/rosbags-${pkgver}.tar.gz")
sha256sums=('5893fd5fe372059839693dde528208605e9839e09fa5e56c502f542b0fac1e83')

_pkgname=rosbags

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
