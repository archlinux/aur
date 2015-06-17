# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: Paolo Giangrandi <peoro.noob@gmail.com>
pkgname=impacket
pkgver=0.9.13
pkgrel=1
pkgdesc="Collection of Python2 classes focused on providing access to network packets"
arch=('i686' 'x86_64')
url="http://corelabs.coresecurity.com/index.php?module=Wiki&action=view&type=tool&name=Impacket"
license='APACHE'
depends=('python2' 'python2-crypto')
optdepends=('pcapy: traffic sniffing example programs')
makedepends=('sed')
source=("$pkgname-$pkgver.tar.gz::https://pypi.python.org/packages/source/i/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('9c9ba1ea12776b023a4fec4b0f6f60cfed33d337da948111951f452548fd213a5f48698126a9c8735706ae5d05111f0de3f20b17c221567ca98d2c84bb22ccef')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 || return 1
  install -D LICENSE ${pkgdir}/usr/share/licenses/impacket/LICENSE
}

