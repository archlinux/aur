# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>

pkgname=cryptobridge-bin
pkgver=0.18.3
pkgrel=1
pkgdesc="CryptoBridge: Cryptocurrency and Decentralized Exchange. Advanced wallet interface for the BitShares financial blockchain."
arch=('x86_64')
url="https://github.com/CryptoBridge/cryptobridge-ui"
license=('MIT')
provides=('cryptobridge')
depends=('gconf' 'libnotify' 'libxss' 'libxtst' 'nss')
source=("cryptobridge-${pkgver}.deb::https://github.com/CryptoBridge/cryptobridge-ui/releases/download/v${pkgver}/CryptoBridge_${pkgver}_amd64.deb")
sha512sums=('a5fccb1fe92d88911a12699f041743d9f9aa531cf48eb43ea648fa5708e48b33bc726d46fff2188d5904ebcc8dd67c13e69ccd326aec534036e6ea78aed0f6f1')

package() {
    bsdtar xf data.tar.xz -C "${pkgdir}/"
    install -D -m644 "${pkgdir}/opt/CryptoBridge/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
    install -D -m644 "${pkgdir}/opt/CryptoBridge/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s /opt/CryptoBridge/cryptobridge "${pkgdir}/usr/bin/cryptobridge"
}
