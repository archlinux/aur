# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=waves-client
pkgver=1.0.0_beta
pkgrel=1
pkgdesc="The official client application for the Waves platform"
arch=('x86_64')
url="https://wavesplatform.com/"
license=('custom')
depends=('gtk2' 'libxtst' 'libxss' 'gconf' 'nss' 'alsa-lib')
source=("https://wavesplatform.com/files/WavesClient-${pkgver/_/-}.X-linux.deb")
sha256sums=('625dec99daa10b5455c2ff25451bcb83a60cef00f8e5af7f36b422e15117d04c')

package() {
    bsdtar -O -xf "WavesClient-${pkgver/_/-}"*.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/Waves Client/waves-client" "${pkgdir}/usr/bin/waves-client"
}