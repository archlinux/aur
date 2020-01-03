# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=studiolink-lv2
pkgver=v17.03.1
_pkgver=${pkgver}-beta
pkgrel=1
pkgdesc="A SIP application to create high quality Audio over IP (AoIP) connections. LV2 Plugin."
arch=('x86_64')
url="https://studio-link.de"
license=('custom')
depends=('alsa-lib' 'libpulse' 'openssl-1.0')
source=("https://github.com/Studio-Link/app/releases/download/${_pkgver}/studio-link-plugin-linux.zip"
        "LICENSE")
sha512sums=('160ada683b703fecd6b99d0b9974b8ab57a477c688ed9842ba9132255c65dad68775b7c1cf7095b339b0117fe0aad1523ffe9accc8e39c964dbd8d37737e48aa'
            'a3c168d3605190b7de36707a42d1450a22bd0d0b50b52bb4e0a8b169c1035f04f58dca8227d8557f9f0cc574d18323780efa035fd6cd57c3bb35d69a3c517937')

package() {
    install -Dm755 ${srcdir}/studio-link.lv2/studio-link.so ${pkgdir}/usr/lib/lv2/studiolink-lv2/studio-link.so
    install -Dm644 ${srcdir}/studio-link.lv2/studio-link.ttl ${pkgdir}/usr/lib/lv2/studiolink-lv2/studio-link.ttl
    install -Dm644 ${srcdir}/studio-link.lv2/manifest.ttl ${pkgdir}/usr/lib/lv2/studiolink-lv2/manifest.ttl
    
    install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/studiolink-lv2/LICENSE"
}
