# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=waves-client
pkgver=1.0.28
pkgrel=2
pkgdesc="The official client application for the Waves platform"
arch=('x86_64')
url="https://wavesplatform.com/"
license=('MIT')
depends=('gtk2' 'libxtst' 'libxss' 'gconf' 'nss' 'alsa-lib')
source=("https://wavesplatform.com/files/WavesClient-${pkgver/_/-}-linux.deb")
sha256sums=('b84f28b5bf96983fadb54417fea8ba90be1939700514cb9e5ff7554865cfcfc6')

package() {
    bsdtar -O -xf "WavesClient-${pkgver/_/-}"*.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/Waves Client/waves-client" "${pkgdir}/usr/bin/waves-client"
}
