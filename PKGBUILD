# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>

pkgname=cryptobridge-bin
pkgver=0.12.6
pkgrel=1
pkgdesc="CryptoBridge: Cryptocurrency and Decentralized Exchange. Advanced wallet interface for the BitShares financial blockchain."
arch=('x86_64')
url="https://github.com/CryptoBridge/cryptobridge-ui"
license=('MIT')
provides=('cryptobridge')
depends=('gconf' 'libnotify' 'libxss' 'libxtst' 'nss')
source=("cryptobridge-${pkgver}.deb::https://github.com/CryptoBridge/cryptobridge-ui/releases/download/v${pkgver}/CryptoBridge_${pkgver}_amd64.deb")
sha512sums=('236f0adeebe79abf53d9f8907b66faa1460cb2baefb8fd1281ca82adca2d90459c3dd3fa7bd25a6e82feb112979f1b2a6f9b0142e087cdbac23a05e5a3b54e83')

package() {
    bsdtar xf data.tar.xz -C "${pkgdir}/"
    install -D -m644 "${pkgdir}/opt/CryptoBridge/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
    install -D -m644 "${pkgdir}/opt/CryptoBridge/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s /opt/CryptoBridge/cryptobridge "${pkgdir}/usr/bin/cryptobridge"
}
