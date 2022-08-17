# Maintainer: Jozef Riha <jose1711 at gmail dot com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

pkgname=disktype
pkgver=9
pkgrel=5
pkgdesc="a utility to detect the content format of a disk or disk image"
url="http://${pkgname}.sourceforge.net"
license=('custom')
arch=('i686' 'x86_64')
depends=(glibc)
source=(https://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('3642e35af55341db089d3b671ddecb026eca67a9f63ba55456a0c63c3fa611e3888104e5c14c18959435577a08d1fd93f1794fbb37e0d8118ab9be65f474bdf3')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dvm755 ${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm 644 ${pkgname}.1 -t "${pkgdir}/usr/share/man/man1/"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
