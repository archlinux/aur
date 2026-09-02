# Maintainer: Valentin Batz <valentin.batz+archlinux@posteo.de>
pkgname=mdns-browser-bin
pkgver=1.20.2
pkgrel=1
pkgdesc="A cross platform mDNS browsing app written in Rust using tauri and leptos "
arch=('x86_64')
url="https://github.com/hrzlgnm/mdns-browser"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
conflicts=('mdns-browser')
source_x86_64=("https://github.com/hrzlgnm/mdns-browser/releases/download/v1.20.2/mdns-browser_${pkgver}_amd64.deb" "https://github.com/hrzlgnm/mdns-browser/releases/download/v1.20.2/mdns-browser_linux_x64")
sha256sums_x86_64=('67c44938ef933917c5dcfec28169192b21d9646b7a5d0ae73b737100c5dd20cf' '979da898ab34f36d7e0025ece89e8931e57f9f1549028427758d1221bf8a1f74')
package() {
    # The .deb contains the icons, .desktop file and other files installed to shared.
    tar -xz -f data.tar.gz -C "${pkgdir}"
    # The .deb contains a binary that has auto updates enabled for the .deb.
    # We install a unbundled version of the binary to have auto updates disabled.
    install -Dm755 mdns-browser_linux_x64 "${pkgdir}/usr/bin/mdns-browser"
}
