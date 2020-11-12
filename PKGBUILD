# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-btchip
pkgver=0.1.30
pkgrel=2
pkgdesc="Python library to communicate with BTChip dongle"
arch=('any')
depends=('python-hidapi')
makedepends=('python-setuptools')
optdepends=('btchip-udev: access BTChip as non-root user')
url="https://github.com/LedgerHQ/btchip-python"
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LedgerHQ/btchip-python/archive/v$pkgver.tar.gz")
sha256sums=('66f999b728b168cb24374ddcf32a8315cbe76d9550640f414d1b8a7db4c5998b')

build() {
  cd "btchip-python-$pkgver"
  python setup.py build
}

package_python-btchip() {
  cd "btchip-python-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
