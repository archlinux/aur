# Maintainer: motudev <fabian.roos@motusoft.dev>
pkgname=tomatick-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Modern, lightweight Pomodoro timer (pre-built binary)"
arch=('x86_64')
url="https://github.com/motudev/tomatick"
license=('MIT')
depends=('gtk4' 'libadwaita' 'dbus')
provides=('tomatick')
conflicts=('tomatick')
install=tomatick.install
source=(``
    "tomatick::https://github.com/motudev/tomatick/releases/download/v${pkgver}/tomatick"
    "tomatick.svg"
    "tray-break.svg"
    "dev.motusoft.Tomatick.desktop"
    "LICENSE"
)
sha256sums=(
    'ba6b63aa4e21cba98ee32f9654332da74cba2e7264b3f7e401f8ec8cc4f04941'    # tomatick binary — updated by CI
    '60f58c592416951379fa3b4cfcf3b68b3976da7b4cc7901d77933db9a85e20f1'
    '9021cff41dbaa22e94fc5cdf3d219d2ec52663ba6c34e161f0e32c0149915a8f'
    '0cae62e6dd9c7a64e3a56743e0be9403e135202d055da2e4b9a624a97f4d8e52'
    '1b6feffdec4f2448110bf7c020a6802eb3761b883224902180e89c20dcbc88ba'
)

package() {
    install -Dm755 tomatick "$pkgdir/usr/bin/tomatick"
    install -Dm644 tomatick.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/tomatick.svg"
    install -Dm644 tray-break.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/tomatick-break.svg"
    install -Dm644 dev.motusoft.Tomatick.desktop \
        "$pkgdir/usr/share/applications/dev.motusoft.Tomatick.desktop"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
