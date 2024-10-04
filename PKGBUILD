# Maintainer: snygg <snygg at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: jharch <julian dot hossbach at gmx dot de>
# Contributor: Joonas Kärkkäinen <group55 at eth1 dot fi>
pkgname=lexmark-network-scan
pkgver=3.17.0.0
_revision=01252024
pkgrel=2
pkgdesc="Lexmark Network and USB Scan Drivers"
arch=('x86_64')
url="http://www.lexmark.com/"
license=('custom')
depends=('java-runtime' 'sane' 'systemd' 'xorg-xdpyinfo')
optdepends=('sane-frontends: sane scanner frontends'
            'xsane: sane scanner frontend')
provides=('libsane-lexmark_nscan.so=1.0.16')
install="$pkgname.install"
source=("https://downloads.lexmark.com/downloads/drivers/lexmark_network-scan-linux-glibc2_${_revision}_${CARCH}.deb")
sha256sums=('294b2e8eb93f1c74257d540c24a04ee24cacd64dae30bc9050b6f1e7fb845775')

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir"

  # Symlink license files to proper directory
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$pkgdir/usr/share/doc/$pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "$pkgdir/usr/local/lexmark/unix_scan_drivers/docs/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/"
}
