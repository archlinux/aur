# Maintainer: Alex Macocian <amacocian@yahoo.com>
pkgname=quick-visor
pkgver=0.0.5
pkgrel=1
pkgdesc="Quickshell-based display manager overlay for Hyprland"
arch=('any')
url="https://github.com/AlexMacocian/quick-visor"
license=('MIT')
depends=(
    'quickshell'
    'qt6-declarative'
    'hyprland'
    'inotify-tools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AlexMacocian/quick-visor/archive/v${pkgver}.tar.gz")
sha256sums=('28d006481dde25f7ccc81532d0a66ef87582de5a0c802242832d116c4f346a52')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -dm755 "${pkgdir}/usr/share/quickshell/${pkgname}"
    install -m644 qml/* "${pkgdir}/usr/share/quickshell/${pkgname}/"
    install -Dm755 bin/quick-visor "${pkgdir}/usr/bin/quick-visor"
    install -Dm755 bin/quick-visor "${pkgdir}/usr/bin/quick-visor"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
