# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-rosbags
pkgver=0.9.19
pkgrel=1
pkgdesc='Pure Python library to read, modify, convert, and write rosbag files.'
arch=(any)
url='https://gitlab.com/ternaris/rosbags'
license=('Apache-2.0')
depends=('python' 'python-lz4' 'python-numpy' 'python-ruamel-yaml' 'python-zstandard')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/ternaris/rosbags/-/archive/v${pkgver}/rosbags-v${pkgver}.tar.gz")
sha256sums=('cde1b718c148e131bfcddd65856ed05065dbb673f4e0cdd2f48f9d9ea7ab4d10')

_pkgname=rosbags

build() {
  cd "${srcdir}/${_pkgname}-v${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-v${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
