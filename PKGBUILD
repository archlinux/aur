# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-rosbags
pkgver=0.9.16
pkgrel=1
pkgdesc='Pure Python library to read, modify, convert, and write rosbag files.'
arch=(any)
url='https://gitlab.com/ternaris/rosbags'
license=('Apache-2.0')
depends=('python' 'python-lz4' 'python-numpy' 'python-ruamel-yaml' 'python-zstandard')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver::https://gitlab.com/ternaris/rosbags/-/archive/v${pkgver}/rosbags-v${pkgver}.tar.gz")
sha256sums=('3e0b0748fb8198b6be8ffeac78213abda2027b8317a8f58317f3d9485a7cbb1e')

_pkgname=rosbags

build() {
  cd "${srcdir}/${_pkgname}-v${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-v${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
