# Maintainer: alcros: trz67ggjr5 [/at\] gmx DOT de
# Contributor: notizblock: nblock [/at\] archlinux DOT us

pkgname=mtkbabel
pkgver=0.8.3.1
pkgrel=2
pkgdesc="Operation software for GPS devices based on the MediaTek MTK chipset"
arch=('any')
url="http://mtkbabel.sourceforge.net"
license=('GPL2')
depends=('perl' 'perl-device-serialport' 'perl-timedate')
install=${pkgname}.install
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.patch")

prepare() {
  cd "${pkgver}"

  patch -p1 < ../${pkgname}.patch
}

package() {
  cd "${pkgver}"
  
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 MtkExtensionsv1.xsd ${pkgdir}/usr/share/${pkgname}/MtkExtensionsv1.xsd
  install -Dm644 ${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
}

sha512sums=('795d058bf622b5381600fc82a67aa32258db0ce2d1c22f148b6a1b34a6afe585f31fd0a5fccd2743602b55f53fa3b6b0f8c7269ebee1555a58374e33a80d22d7'
            '4969fc00ba4633cd05e606aa84cfc2acbff0f6036c99985f241cc8157d2b40993a911c0d6020900bec57905e1e85882e7334f3b620a810a09540e5d020f46a4d')
