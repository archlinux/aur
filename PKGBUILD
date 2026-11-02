# Maintainer: Valentin Batz <valentin.batz+archlinux@posteo.de>
pkgname=mdns-browser-bin
pkgver=2.9.9
pkgrel=1
pkgdesc="A cross platform mDNS browsing app written in Rust using tauri and svelte "
arch=('x86_64')
url="https://github.com/hrzlgnm/mdns-browser"
license=('MIT' 'OFL-1.1')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
conflicts=('mdns-browser')
source_x86_64=("https://github.com/hrzlgnm/mdns-browser/releases/download/v2.9.9/mdns-browser_${pkgver}_amd64.deb" "https://github.com/hrzlgnm/mdns-browser/releases/download/v2.9.9/mdns-browser_linux_x64")
sha256sums_x86_64=('a8df06c6369713c110175238ae748c6df654b2d50c492a355804bb069ef77eaf' '2610c2c8e2e4173e0de7efa4aecf5f7825d7aa08b02fd519bd8f729767a729c4')
package() {
    # The .deb contains the icons, .desktop file and other files installed to shared.
    tar -xz -f data.tar.gz -C "${pkgdir}"
    # The .deb contains a binary that has auto updates enabled for the .deb.
    # We install a unbundled version of the binary to have auto updates disabled.
    install -Dm755 mdns-browser_linux_x64 "${pkgdir}/usr/bin/mdns-browser"
}
