# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Hyacinthe Cartiauw <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=gns3-converter
pkgver=1.3.0
pkgrel=2
pkgdesc='GNS3 topology converter'
arch=('any')
url='https://github.com/GNS3/gns3-converter'
license=('GPL3')
groups=('gns3')
makedepends=('python-setuptools')
depends=('python-configobj' 'python-cx_freeze')
replaces=('gns3-net-converter')
conflicts=('gns3-net-converter')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GNS3/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('771b3ab878de87007d00342507bdd381c8d60870afa1537b20e791f5d4d80716')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
