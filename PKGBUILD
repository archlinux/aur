# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-btchip
pkgver=0.1.31
pkgrel=1
pkgdesc="Python library to communicate with BTChip dongle"
arch=('any')
depends=('python-hidapi')
makedepends=('python-setuptools')
optdepends=('btchip-udev: access BTChip as non-root user')
url="https://github.com/LedgerHQ/btchip-python"
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LedgerHQ/btchip-python/archive/v$pkgver.tar.gz")
sha512sums=('dd943df6724131e79b2f556303df6f21a859ddbfe02ade5aaa9b39fb305f6faf5b4a6eb645791c4441c6a7464e95ca1122398f4a0c18fc64464bfb145048dbf7')

build() {
  cd "btchip-python-$pkgver"
  python setup.py build
}

package_python-btchip() {
  cd "btchip-python-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
