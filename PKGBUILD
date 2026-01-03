pkgname=wl-kaomoji
pkgver=1.0.0
pkgrel=1
pkgdesc="wayland kaomoji picker using wofi"
arch=('any')
url="https://github.com/xo-xo-xo-xo/wl-kaomoji"
license=('MIT')
depends=('bash' 'wofi' 'wl-clipboard' 'wtype' 'jq')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "emoticons.json::https://raw.githubusercontent.com/w33ble/emoticon-data/master/emoticons.json")
sha256sums=('SKIP'
            'SKIP')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    install -Dm755 wl-kaomoji "${pkgdir}/usr/bin/wl-kaomoji"
    install -Dm644 "${srcdir}/emoticons.json" "${pkgdir}/usr/share/${pkgname}/emoticons.json"
    
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}