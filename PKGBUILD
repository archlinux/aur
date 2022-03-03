# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-rosbags
pkgver=0.9.9
pkgrel=1
pkgdesc='Pure Python library to read, modify, convert, and write rosbag files.'
arch=(any)
url='https://gitlab.com/ternaris/rosbags'
license=('Apache-2.0')
depends=('python' 'python-lz4' 'python-numpy' 'python-ruamel-yaml' 'python-zstandard')
makedepends=('python' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver::https://files.pythonhosted.org/packages/cc/ad/5be6aea93a088caee179400c3a54b01fa1338e78a4b2c1dbf3fe65e7290b/rosbags-${pkgver}.tar.gz")
sha256sums=('41a4eaa1ccb7ffc72d5774f49318228e52e6c1d10bf3c7b410f637dab7d08cfc')

_pkgname=rosbags

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
