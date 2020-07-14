# Contributor: Joonas Kärkkäinen <group55@eth1.fi>
# Lexmark network scan driver for Linux, tested with Lexmark MX517de
# Please report working/not working devides or if you found something else to need to be fix :)

pkgname=lexmark-network-scan
pkgver=1.1
pkgrel=1.1
pkgdesc="Lexmark proprietary Network scan driver for Linux"
arch=('x86_64')
url="http://www.lexmark.com/"
license=('custom,proprietary')
depends_x86_64=('sane' 'xsane' 'java-runtime')
install=lexmark-network-scan.install
source=("https://downloads.lexmark.com/downloads/drivers/lexmark_network-scan-linux-glibc2_04022020_x86_64.deb")
noextract=("lexmark_network-scan-linux-glibc2_04022020_x86_64.deb")
md5sums=('575f9e2d7f12ed7a0ddb1daca5d6331d')

package() {
  bsdtar -O -xf "lexmark_network-scan-linux-glibc2_04022020_x86_64.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
  bsdtar -O -xf "lexmark_network-scan-linux-glibc2_04022020_x86_64.deb" control.tar.gz | bsdtar -C "${pkgdir}" -xJf -
  
  install -dm755 "${pkgdir}/usr/local/lexmark"
}
