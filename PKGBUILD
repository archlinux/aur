# Maintainer: jharch <julian dot hossbach at gmx dot de>
# Contributor: Joonas Kärkkäinen <group55 at eth1 dot fi>
# Lexmark network scan driver for Linux, tested with Lexmark MX517de
# Please report working/not working devides or if you found something else to need to be fix :)

pkgname=lexmark-network-scan
pkgver=3.7
pkgrel=1
pkgdesc="Lexmark proprietary Network scan driver for Linux"
arch=('x86_64')
url="http://www.lexmark.com/"
license=('custom' 'proprietary')
depends_x86_64=('sane' 'xsane' 'java-runtime')
install=lexmark-network-scan.install
source=("https://downloads.lexmark.com/downloads/drivers/lexmark_network-scan-linux-glibc2_02012021_x86_64.deb")
noextract=("lexmark_network-scan-linux-glibc2_02012021_x86_64.deb")
md5sums=('5f7493273e21bb6e28d13868f1c73d22')

package() {
  bsdtar -O -xf "lexmark_network-scan-linux-glibc2_02012021_x86_64.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
  bsdtar -O -xf "lexmark_network-scan-linux-glibc2_02012021_x86_64.deb" control.tar.gz | bsdtar -C "${pkgdir}" -xJf -
  
  install -dm755 "${pkgdir}/usr/local/lexmark"
}
