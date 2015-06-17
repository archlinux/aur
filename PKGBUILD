# Maintainer: sikmir <sikmir at gmail dot com>
# Contributor: jj < markiza @ gmail.com >

pkgname=iscan-plugin-gt-f500
pkgver=1.0.0
pkgrel=1
pkgdesc="iscan plugin for Epson Perfection 2580 Photo scanners"
arch=('i686')
url="http://avasys.jp/eng/linux_driver/"
license=('custom')
depends=('iscan-legacy')
makedepends=('rpmextract')

source=(http://a1227.g.akamai.net/f/1227/40484/1d/download.ebz.epson.net/dsc/f/01/00/01/58/54/1899fd522665e4b1c80fe95252838994192d5207/iscan-plugin-gt-f500-1.0.0-1.c2.i386.rpm)
md5sums=('8b1c398ef58769d9ceb77ad771515de3')

package() {
  cd ${startdir}
  rpmextract.sh ${pkgname}-${pkgver}-1.c2.i386.rpm
  mv usr ${pkgdir}
  mkdir -p ${pkgdir}/usr/share/licenses/iscan
  mv ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/*.en.txt ${pkgdir}/usr/share/licenses/iscan/
  rm -rf ${pkgdir}/usr/share/doc
}

