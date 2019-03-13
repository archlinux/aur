# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=waves-client
pkgver=1.1.0
pkgrel=1
pkgdesc="The official client application for the Waves platform"
arch=('x86_64')
url="https://wavesplatform.com/"
license=('MIT')
depends=('gtk2' 'libxtst' 'libxss' 'gconf' 'nss' 'alsa-lib')
source=("https://wavesplatform.com/files/WavesClient-linux.deb")
sha256sums=('c7e7c534de98b777942112561c23e4f175203167d7eb486c96ad83821df38991')

package() {
    bsdtar -O -xf WavesClient-linux.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/Waves Client/waves-client" "${pkgdir}/usr/bin/waves-client"
}
