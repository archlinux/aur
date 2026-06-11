# Maintainer: Advnirr <vnaosov@gmail.com>
pkgname=hanuchi
pkgver=1.2.0
pkgrel=1
pkgdesc="Minimalist GTK4 frontend for LogMeIn Hamachi"
arch=('any')
url="https://github.com/Advnirr/hanuchi"
license=('MIT')
depends=('python' 'gtk4' 'libadwaita' 'python-gobject' 'logmein-hamachi')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Advnirr/hanuchi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('edcd9b78fa4e4e19d08be1f19e088a91a6fd1434479ff9a4e05b04e047981135')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 "hanuchi" "${pkgdir}/usr/bin/hanuchi"
    install -Dm644 "hanuchi.desktop" "${pkgdir}/usr/share/applications/hanuchi.desktop"
    
    # ТУТ ИСПРАВИЛ: ищем assets/hanuchi.svg
    install -Dm644 "assets/hanuchi.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/hanuchi.svg"
    
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
