# Maintainer: hyprarcher <hyprarcher@proton.me>
pkgname=wayscriber-bin
pkgver=0.9.25
pkgrel=1
pkgdesc='Screen annotation tool for Wayland compositors (prebuilt binaries)'
arch=('x86_64')
url='https://wayscriber.com'
license=('MIT')
depends=(
    'cairo'
    'wayland'
    'pango'
    'libxkbcommon'
    'gcc-libs'
    'glibc'
    'gtk4'
    'wl-clipboard'
    'grim'
    'slurp'
) 
optdepends=(
    'wayscriber-configurator: GUI configurator (F11)'
)
backup=('usr/lib/systemd/user/wayscriber.service')
provides=('wayscriber')
conflicts=('wayscriber' 'wayscriber-debug')
replaces=('wayscriber-debug')
source_x86_64=("wayscriber-v0.9.25-linux-x86_64.tar.gz::https://github.com/devmobasa/wayscriber/releases/download/v0.9.25/wayscriber-v0.9.25-linux-x86_64.tar.gz")
sha256sums_x86_64=('5b44a3bab2e1abc4cfbe094ab96b3374ef879be7c70374a25ab419c9e8be72f5')

_tarball="wayscriber-v${pkgver}-linux-${CARCH}.tar.gz"

package() {
    local srcdir_tmp="${srcdir}/extract"
    rm -rf "${srcdir_tmp}"
    mkdir -p "${srcdir_tmp}"
    tar -xzf "${srcdir}/${_tarball}" -C "${srcdir_tmp}" --strip-components=1

    install -Dm755 "${srcdir_tmp}/usr/bin/wayscriber" "$pkgdir/usr/bin/wayscriber"

# Wayscriber desktop integration
    install -Dm644 "${srcdir_tmp}/usr/share/applications/wayscriber.desktop" "$pkgdir/usr/share/applications/wayscriber.desktop"
    install -Dm644 "${srcdir_tmp}/usr/share/icons/hicolor/16x16/apps/wayscriber.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/wayscriber.png"
    install -Dm644 "${srcdir_tmp}/usr/share/icons/hicolor/19x19/apps/wayscriber.png" "$pkgdir/usr/share/icons/hicolor/19x19/apps/wayscriber.png"
    install -Dm644 "${srcdir_tmp}/usr/share/icons/hicolor/22x22/apps/wayscriber.png" "$pkgdir/usr/share/icons/hicolor/22x22/apps/wayscriber.png"
    install -Dm644 "${srcdir_tmp}/usr/share/icons/hicolor/24x24/apps/wayscriber.png" "$pkgdir/usr/share/icons/hicolor/24x24/apps/wayscriber.png"
    install -Dm644 "${srcdir_tmp}/usr/share/icons/hicolor/38x38/apps/wayscriber.png" "$pkgdir/usr/share/icons/hicolor/38x38/apps/wayscriber.png"
    install -Dm644 "${srcdir_tmp}/usr/share/icons/hicolor/64x64/apps/wayscriber.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/wayscriber.png"
    install -Dm644 "${srcdir_tmp}/usr/share/icons/hicolor/128x128/apps/wayscriber.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/wayscriber.png"
    install -Dm644 "${srcdir_tmp}/usr/share/icons/hicolor/16x16/status/wayscriber.png" "$pkgdir/usr/share/icons/hicolor/16x16/status/wayscriber.png"
    install -Dm644 "${srcdir_tmp}/usr/share/icons/hicolor/19x19/status/wayscriber.png" "$pkgdir/usr/share/icons/hicolor/19x19/status/wayscriber.png"
    install -Dm644 "${srcdir_tmp}/usr/share/icons/hicolor/22x22/status/wayscriber.png" "$pkgdir/usr/share/icons/hicolor/22x22/status/wayscriber.png"
    install -Dm644 "${srcdir_tmp}/usr/share/icons/hicolor/24x24/status/wayscriber.png" "$pkgdir/usr/share/icons/hicolor/24x24/status/wayscriber.png"
    install -Dm644 "${srcdir_tmp}/usr/share/icons/hicolor/38x38/status/wayscriber.png" "$pkgdir/usr/share/icons/hicolor/38x38/status/wayscriber.png"
    install -Dm644 "${srcdir_tmp}/usr/share/icons/hicolor/64x64/status/wayscriber.png" "$pkgdir/usr/share/icons/hicolor/64x64/status/wayscriber.png"
    install -Dm644 "${srcdir_tmp}/usr/share/icons/hicolor/128x128/status/wayscriber.png" "$pkgdir/usr/share/icons/hicolor/128x128/status/wayscriber.png"
    install -Dm644 "${srcdir_tmp}/usr/share/pixmaps/wayscriber.png" "$pkgdir/usr/share/pixmaps/wayscriber.png"
    install -Dm644 "${srcdir_tmp}/usr/share/icons/hicolor/scalable/apps/wayscriber.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/wayscriber.svg"
    install -Dm644 "${srcdir_tmp}/usr/share/icons/hicolor/symbolic/apps/wayscriber-symbolic.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/wayscriber-symbolic.svg"
# End Wayscriber desktop integration
    install -Dm644 "${srcdir_tmp}/usr/lib/systemd/user/wayscriber.service" "$pkgdir/usr/lib/systemd/user/wayscriber.service"
    install -Dm644 "${srcdir_tmp}/usr/share/doc/wayscriber/config.example.toml" "$pkgdir/usr/share/doc/wayscriber/config.example.toml"
    install -Dm644 "${srcdir_tmp}/usr/share/doc/wayscriber/README.md" "$pkgdir/usr/share/doc/wayscriber/README.md"
    [ -f "${srcdir_tmp}/usr/share/doc/wayscriber/LICENSE" ] && install -Dm644 "${srcdir_tmp}/usr/share/doc/wayscriber/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || true
    install -Dm644 "${srcdir_tmp}/usr/share/licenses/wayscriber/LICENSE.gtk4-layer-shell" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.gtk4-layer-shell"
}
