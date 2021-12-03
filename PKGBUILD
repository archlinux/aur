# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-btchip
pkgver=0.1.32
pkgrel=2
pkgdesc="Python library to communicate with BTChip dongle"
arch=('any')
depends=('python-hidapi')
makedepends=('python-setuptools')
optdepends=('btchip-udev: access BTChip as non-root user')
url="https://github.com/LedgerHQ/btchip-python"
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LedgerHQ/btchip-python/archive/$pkgver.tar.gz")
sha512sums=('ec9218743fdb71af794bc8e3bf27c3c40bec5b4f90376288e360f4de004eb5acf85a5aaba06ec76c670b4f7e14281b8cc3c3b23f4348de6d65a4b978d7aa8acb')

build() {
  cd "btchip-python-$pkgver"
  python setup.py build
}

package_python-btchip() {
  cd "btchip-python-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
