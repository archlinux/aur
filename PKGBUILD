# Maintainer: alcros: trz67ggjr5 [/at\] gmx DOT de
# Contributor: notizblock: nblock [/at\] archlinux DOT us

pkgname=mtkbabel
pkgver=0.8.4
pkgrel=1
pkgdesc="Operation software for GPS devices based on the MediaTek MTK chipset"
arch=('any')
url="http://mtkbabel.sourceforge.net"
license=('GPL2')
depends=('perl' 'perl-device-serialport' 'perl-timedate')
install=${pkgname}.install
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.patch")

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -p1 < ../${pkgname}.patch
}

package() {
  cd "${pkgname}-${pkgver}"
  
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 MtkExtensionsv1.xsd ${pkgdir}/usr/share/${pkgname}/MtkExtensionsv1.xsd
  install -Dm644 ${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
}

sha512sums=('baf2f0c9c98723746b50885dc51f8136082e2f630f3ae1d8f65ffc9ca3f7f1607e3a34258cca58f89b6e53c92637a24feaec663dc9f20a5c8fa4e1d98dfacc29'
            '4969fc00ba4633cd05e606aa84cfc2acbff0f6036c99985f241cc8157d2b40993a911c0d6020900bec57905e1e85882e7334f3b620a810a09540e5d020f46a4d')
