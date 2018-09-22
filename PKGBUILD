# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='python-nonblock'
_realName=python-nonblock
pkgdesc="Pure-Python non-blocking IO functions"
pkgver=4.0.0
pkgrel=3
arch=('any')
license=('LGPLv2')
url="http://github.com/kata198/python-nonblock"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/python-nonblock/archive/${pkgver}.tar.gz")
backup=("etc/nonblock.cfg")
sha512sums=("868ad345cd1015c9845d98891ea5dd8471018b7fd73586ac36c8ed3a3782d384477e78223097ae7c318b964b6912506bfbc2153fca09163d05d35066811b05ae")

build() {
  cd "$srcdir/${_realName}-$pkgver"
  python setup.py build
}

package() {
  cd "${_realName}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

}
