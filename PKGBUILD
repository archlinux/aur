# Maintainer: Inklare <vnaosov@gmail.com>
pkgname=hanuchi
pkgver=1.1.0
pkgrel=1
pkgdesc="Minimalist GTK4 frontend for LogMeIn Hamachi"
arch=('any')
url="https://github.com/Inklare/hanuchi"
license=('MIT')
depends=('python' 'gtk4' 'libadwaita' 'python-gobject' 'logmein-hamachi')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Inklare/hanuchi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('91a072ee40508bc2f60dbfe0720e570490d450653ef57afd736f189db6f7a2ca')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 "hanuchi" "${pkgdir}/usr/bin/hanuchi"
    install -Dm644 "hanuchi.desktop" "${pkgdir}/usr/share/applications/hanuchi.desktop"
    
    # ТУТ ИСПРАВИЛ: ищем assets/hanuchi.svg
    install -Dm644 "assets/hanuchi.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/hanuchi.svg"
    
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
