# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=python-btlewrap
_pkgname=btlewrap
pkgver=0.0.4
pkgrel=1
pkgdesc="Bluetooth LowEnergy wrapper for different python backends"
url="https://github.com/ChristianKuehnel/btlewrap"
arch=("any")
license=("MIT")
depends=("python" "python-bluepy")
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/ChristianKuehnel/btlewrap/archive/v${pkgver}.tar.gz)
sha512sums=("9b6d71f2ab441ca045c23dce14c792157eb5e16c684d7a6acb44f57f0585ab79fe26f9a06f72c8b986ec249b01a7c58f60656126471bdcf15972f02bf1acf007")

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --skip-build -O1 --root="${pkgdir}"
}

# vim: ts=2 sw=2 et:
