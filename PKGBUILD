# Maintainer: termuellinator

pkgname=lug-helper
pkgver=2.6
pkgrel=1
epoch=1
pkgdesc="Star Citizen's Linux Users Group Helper Script"
arch=('any')
depends=('bash' 'coreutils' 'curl' 'findutils')
optdepends=('zenity' 'polkit')
provides=('lug-helper')
conflicts=('lug-helper')
url="https://github.com/starcitizen-lug/lug-helper"
license=('GPL3')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/starcitizen-lug/lug-helper/archive/refs/tags/v${pkgver}.tar.gz"
    'lug-helper.desktop'
)
sha256sums=(
    '4fc0fba780d0cf36e2b7756b9f4d318c86bc2a9feb5c781dbe434202503bf879'
    'a69118baac0cd55dfb85a81de1873ab1fee85d3477e13c10628a824ebdc5e22f'
)


package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/lug-helper.sh" "$pkgdir/usr/bin/lug-helper"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/lug-logo.png" "$pkgdir/usr/share/pixmaps/lug-logo.png"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/lutris-sc-install.json" "$pkgdir/usr/share/lug-helper/lutris-sc-install.json"
    install -Dm755 "${srcdir}/lug-helper.desktop" "$pkgdir/usr/share/applications/lug-helper.desktop"
}
 
