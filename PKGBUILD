# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-rosbags
pkgver=0.9.14
pkgrel=1
pkgdesc='Pure Python library to read, modify, convert, and write rosbag files.'
arch=(any)
url='https://gitlab.com/ternaris/rosbags'
license=('Apache-2.0')
depends=('python' 'python-lz4' 'python-numpy' 'python-ruamel-yaml' 'python-zstandard')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver::https://gitlab.com/ternaris/rosbags/-/archive/v${pkgver}/rosbags-v${pkgver}.tar.gz")
sha256sums=('2779eba2df76aa0a2d7fbacf1335ec94b7b3fc7e4e4c37977f89aa791d53781a')

_pkgname=rosbags

build() {
  cd "${srcdir}/${_pkgname}-v${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-v${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
