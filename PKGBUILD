# Maintainer: termuellinator

pkgname=lug-helper
pkgver=4.17
pkgrel=1
epoch=1
pkgdesc="Star Citizen's Linux Users Group Helper Script"
arch=('any')
depends=('bash' 'coreutils' 'curl' 'findutils' 'unzip' 'cabextract')
optdepends=('zenity' 'polkit' 'lutris')
provides=('lug-helper')
conflicts=('lug-helper')
url="https://github.com/starcitizen-lug/lug-helper"
license=('GPL3')
source=(
    "${pkgname}-v${pkgver}.tar.gz::https://github.com/starcitizen-lug/lug-helper/releases/download/v${pkgver}/lug-helper-v${pkgver}.tar.gz"
    'lug-helper.desktop'
)
sha256sums=(
    '90bcab3cdd2ff2631fb4571739993fd270aaeea010b0a17c9fc6987af081a568'
    'c2e32dcc04ff2414686d6465a21f7d64d6a8df7a58363e15ade17a58dcf5ca1b'
)


package() {
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}/lug-helper.sh" "$pkgdir/usr/bin/lug-helper"
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}/lug-logo.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/lug-logo.png"
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}/rsi-launcher.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/rsi-launcher.png"
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}/starcitizen.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/starcitizen.png"
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}/lib/sc-launch.sh" "$pkgdir/usr/share/lug-helper/sc-launch.sh"
    install -Dm755 "${srcdir}/lug-helper.desktop" "$pkgdir/usr/share/applications/lug-helper.desktop"
}
