# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=waves-client
pkgver=1.0.0_beta
pkgrel=1
pkgdesc="The official client application for the Waves platform"
arch=('x86_64')
url="https://wavesplatform.com/"
license=('Apache')
depends=('gtk2' 'libxtst' 'libxss' 'gconf' 'nss' 'alsa-lib')
source=("https://wavesplatform.com/files/WavesClient-${pkgver/_/-}.X-linux.deb")
sha256sums=('c3f8f7bcd4926097701a90ae40096feebdf7668baef93e3f3bf0300d2c774303')

package() {
    bsdtar -O -xf "WavesClient-${pkgver/_/-}"*.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/Waves Client/waves-client" "${pkgdir}/usr/bin/waves-client"
}
