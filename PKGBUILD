# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-rosbags
pkgver=0.9.13
pkgrel=1
pkgdesc='Pure Python library to read, modify, convert, and write rosbag files.'
arch=(any)
url='https://gitlab.com/ternaris/rosbags'
license=('Apache-2.0')
depends=('python' 'python-lz4' 'python-numpy' 'python-ruamel-yaml' 'python-zstandard')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver::https://gitlab.com/ternaris/rosbags/-/archive/v${pkgver}/rosbags-v${pkgver}.tar.gz")
sha256sums=('a0adf7b684fe8dca16e198a777add76c5b15381937a3e6e5d9c80d9f4cd8dcc0')

_pkgname=rosbags

build() {
  cd "${srcdir}/${_pkgname}-v${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-v${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
