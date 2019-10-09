# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=waves-client
pkgver=1.4.4
pkgrel=1
pkgdesc="The official client application for the Waves platform"
arch=('x86_64')
url="https://wavesplatform.com/"
license=('MIT')
depends=('gtk2' 'libxtst' 'libxss' 'gconf' 'nss' 'alsa-lib')
source=("https://wavesplatform.com/files/WavesDEX-linux.deb")
sha256sums=('d63f7762cf5d9a75a420028a28f673d73ec623b5d13ec3c519bf693070cab3b2')

package() {
    bsdtar -O -xf WavesDEX-linux.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/Waves DEX/waves-client" "${pkgdir}/usr/bin/waves-client"
}
