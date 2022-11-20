# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pycontracts
pkgver=1.8.14
pkgrel=6
pkgdesc='Declare constraints on function parameters and return values'
arch=('any')
url="https://andreacensi.github.io/contracts"
license=('GPL')
depends=('python38-pyparsing' 'python38-decorator' 'python38-six' 'python38-future')
makedepends=('python38-setuptools' 'python38-pyparsing'
             'python38-decorator' 'python38-six' 'python38-future')
checkdepends=('python38-nose')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/AndreaCensi/contracts/archive/v${pkgver}.tar.gz)
        #python310.patch)
sha512sums=('ae2a96f603d5b87efd83eb9bb84bf0ebec2d71b08cfed9505be22f15c310f6428652e40c69075577eaee343a0babf6fce7db06c4ad3605a88646d9242dfd1003'
            'e3ff04a69b626e5a91e25e16e66b47480830418e9fe092a8c7fdab7225193fe7d31659bb8292685c6f0640aeabf966c5ed842f05e7773a0d05bcc7448f789432')

# prepare() {
#   cd contracts-$pkgver
#   patch -Np1 -i ../python310.patch
# }

build() {
  cd contracts-$pkgver
  python3.8 setup.py build
}

check() {
  cd contracts-$pkgver
  python3.8 setup.py nosetests
}

package_python38-pycontracts() {
  cd contracts-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
