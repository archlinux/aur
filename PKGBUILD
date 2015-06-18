# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Fabian Melters <melters [at] gmail [dot] com>

pkgname=pyrit
pkgver=0.4.0
pkgrel=2
pkgdesc="WPA/WPA2-PSK attacking with gpu and cluster"
url="https://code.google.com/p/pyrit"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('openssl' 'python2' 'zlib' 'libpcap')
optdepends=(
  'cpyrit-cuda: nvidia gpu support'
  'cpyrit-opencl: opencl support'
  'scapy: packet capture analyzation support'
  'python2-sqlalchemy: storage support'
)
source=(https://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
sha512sums=('8111b3f6f1a94319f5e146db6c184eb391c03ca554b20ea7227237afbc546a064898835ad16007333bb63aa725079046d413be11dfc3ecb76c77b6ac5096f7e9')

build() {
  cd ${pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}"
}

# vim: ts=2 sw=2 et:
