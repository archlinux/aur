# Maintainer:	Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor:	rabyte		<gmail.com: rabyte     >

pkgname=freebasic
pkgver=1.03.0
pkgrel=1
pkgdesc="A free BASIC compiler"
arch=('i686' 'x86_64')
url="http://www.freebasic.net/"
license=('GPL2' 'LGPL')
depends=('gcc-libs' 'libxpm' 'libtinfo')
provides=('fbc')
conflicts=('freebasic-examples')
options=(staticlibs)

source_x86_64=(fbc.sh "http://downloads.sourceforge.net/fbc/FreeBASIC-${pkgver}-linux-x86_64.tar.xz")
md5sums_x86_64=('443851851bbd1610448a1df3eb8da6b5'
                'fd47aa49f04220a85a227f4c687fa377')

source_i686=(fbc.sh "http://downloads.sourceforge.net/fbc/FreeBASIC-${pkgver}-linux-x86.tar.xz")
md5sums_i686=('443851851bbd1610448a1df3eb8da6b5'
              '6d20df94ab8fe76c6936c6adf3dce9dc')


package() {
  cd "${srcdir}/FreeBASIC-${pkgver}-linux-${CARCH}"

  install -d -m 755 "${pkgdir}/usr/share"
  ./install.sh -i "${pkgdir}/usr"

  mv "${pkgdir}/usr/bin/fbc" "${pkgdir}/usr/bin/fbc.bin"
  mv "${pkgdir}/usr/man" "${pkgdir}/usr/share/man"

  install -D -m 755 "${srcdir}/fbc.sh" "${pkgdir}/usr/bin/fbc"
}
