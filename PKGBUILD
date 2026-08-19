# Maintainer: Valentin Batz <valentin.batz+archlinux@posteo.de>

pkgname=zux-bin
pkgver=1.6.3
pkgrel=1
pkgdesc="mDNS-SD Visualizer - A cross platform mDNS browsing visualizer written in Rust using tauri and svelte"
arch=('x86_64')
url="https://github.com/hrzlgnm/zux"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
conflicts=('zux')
source_x86_64=("https://github.com/hrzlgnm/zux/releases/download/v$pkgver/zux_${pkgver}_amd64.deb" "https://github.com/hrzlgnm/zux/releases/download/v$pkgver/zux_linux_x64")
sha256sums_x86_64=('d362ae8b88038ec44c3fddfe2f182d8e3fb51c2fb8640d2a8788e2843c494cdb' 'b1ab0a75752dd430aa58239073c3384203f929f5780fac4d294297f5cffa697d')
package() {
    # The .deb contains the icons, .desktop file and other files installed to shared.
    tar -xz -f data.tar.gz -C "${pkgdir}"
    # The .deb contains a binary that has auto updates enabled for the .deb.
    # We install a unbundled version of the binary to have auto updates disabled.
    install -Dm755 zux_linux_x64 "${pkgdir}/usr/bin/zux"
}
