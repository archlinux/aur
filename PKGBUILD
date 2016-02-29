# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: Paolo Giangrandi <peoro.noob@gmail.com>
pkgname=impacket
pkgver=0.9.14
pkgrel=1
pkgdesc="Collection of Python2 classes focused on providing access to network packets"
arch=('i686' 'x86_64')
url="http://corelabs.coresecurity.com/index.php?module=Wiki&action=view&type=tool&name=Impacket"
license=('APACHE')
depends=('python2' 'python2-crypto')
optdepends=('pcapy: traffic sniffing example programs')
makedepends=('sed')
source=("$pkgname-$pkgver.tar.gz::https://pypi.python.org/packages/source/i/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('f937f78da4f54c5bf61053e590364d1d5378bfe59f02aedf7fec9062fa11d3e907aa1d4c66fb323effe9eb523cba571b46a0c5f7f379995d85d478dc23dff2a3')
conflicts=("impacket-git")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 || return 1
  install -D LICENSE ${pkgdir}/usr/share/licenses/impacket/LICENSE
}

