# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-btchip
pkgver=0.1.28
pkgrel=2
pkgdesc="Python library to communicate with BTChip dongle"
arch=('any')
depends=('python-hidapi')
makedepends=('python-setuptools')
optdepends=('btchip-udev: access BTChip as non-root user')
url="https://github.com/LedgerHQ/btchip-python"
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LedgerHQ/btchip-python/archive/v$pkgver.tar.gz")
sha256sums=('b257357321afc641c15deb7b7cc5f6c54a060739dfb4acddc55fdbd18ba17917')

build() {
  cd "btchip-python-$pkgver"
  python setup.py build
}

package_python-btchip() {
  cd "btchip-python-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
