# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
# Contributor: jj < markiza @ gmail.com >
pkgname=iscan-plugin-gt-f500
pkgver=1.0.0
pkgrel=4
pkgdesc='iscan plugin for Epson Perfection 2480/2580 Photo scanners'
arch=('i686' 'x86_64')
url='http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX'
license=('custom:AVASYSPL')
depends=('iscan')
source=("http://a1227.g.akamai.net/f/1227/40484/1d/download.ebz.epson.net/dsc/f/01/00/01/58/54/1899fd522665e4b1c80fe95252838994192d5207/${pkgname}-${pkgver}-1.c2.i386.rpm")
sha256sums=('fe87d16ce22c28e2c320286758bea32ea4cad75c83debd6fe95670b704701464')

package() {
  install -dm755 ${pkgdir}/usr/share/licenses/iscan
  install -Dm755 usr/lib/iscan/libesint41.so.2.0.0 ${pkgdir}/usr/lib/iscan/libesint41.so.2.0.0
  ln -s /usr/lib/iscan/libesint41.so.2.0.0 ${pkgdir}/usr/lib/iscan/libesint41.so
  ln -s /usr/lib/iscan/libesint41.so.2.0.0 ${pkgdir}/usr/lib/iscan/libesint41.so.2
  install -Dm644 usr/share/iscan/esfw41.bin ${pkgdir}/usr/share/iscan/esfw41.bin
  install -Dm644 usr/share/doc/${pkgname}-${pkgver}/*.en.txt ${pkgdir}/usr/share/licenses/iscan
}
