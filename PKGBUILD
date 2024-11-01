# Maintainer: termuellinator

pkgname=lug-helper
pkgver=3.3
pkgrel=2
epoch=1
pkgdesc="Star Citizen's Linux Users Group Helper Script"
arch=('any')
depends=('bash' 'coreutils' 'curl' 'findutils' 'wine' 'winetricks')
optdepends=('zenity' 'polkit' 'lutris')
provides=('lug-helper')
conflicts=('lug-helper')
url="https://github.com/starcitizen-lug/lug-helper"
license=('GPL3')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/starcitizen-lug/lug-helper/archive/refs/tags/v${pkgver}.tar.gz"
    'lug-helper.desktop'
)
sha256sums=(
    '08e273810807ede259e0e14f8681c37c0efe8a0c80b3e7c4a2e5214bfbd66a43'
    'c3cedb70924c42a47ac9ff7e6455403432c41e3320bee752e6158330158f62a0'
)


package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/lug-helper.sh" "$pkgdir/usr/bin/lug-helper"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/lug-logo.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/lug-logo.png"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/rsi-launcher.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/rsi-launcher.png"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/lib/lutris-starcitizen.json" "$pkgdir/usr/share/lug-helper/lutris-starcitizen.json"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/lib/sc-launch.sh" "$pkgdir/usr/share/lug-helper/sc-launch.sh"
    install -Dm755 "${srcdir}/lug-helper.desktop" "$pkgdir/usr/share/applications/lug-helper.desktop"
}
 
