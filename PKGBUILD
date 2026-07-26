# Maintainer: snygg <snygg at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: jharch <julian dot hossbach at gmx dot de>
# Contributor: Joonas Kärkkäinen <group55 at eth1 dot fi>
pkgname=lexmark-network-scan
pkgver=3.19.0.0
pkgrel=1
pkgdesc='Lexmark Network and USB Scan Drivers'
arch=('x86_64')
url="http://www.lexmark.com/"
license=('custom')
depends=('java-runtime' 'sane' 'systemd' 'xorg-xdpyinfo')
optdepends=('sane-frontends: sane scanner frontends'
            'xsane: sane scanner frontend')
provides=('libsane-lexmark_nscan.so=1.0.16')
install="$pkgname.install"
source=('https://downloads.lexmark.com/downloads/drivers/lexmark_network-scan-linux-glibc2_06122026_x86_64.deb')
sha256sums=('3c055cb29dae3b869adac330cc66bf217a783a0c549d23a9ef9de003465751cd')

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir"

  # Symlink license files to proper directory
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$pkgdir/usr/share/doc/$pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "$pkgdir/usr/local/lexmark/unix_scan_drivers/docs/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/"
}
