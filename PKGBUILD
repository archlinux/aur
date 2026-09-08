# Maintainer: Valentin Batz <valentin.batz+archlinux@posteo.de>
pkgname=mdns-browser-bin
pkgver=1.20.4
pkgrel=1
pkgdesc="A cross platform mDNS browsing app written in Rust using tauri and leptos "
arch=('x86_64')
url="https://github.com/hrzlgnm/mdns-browser"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
conflicts=('mdns-browser')
source_x86_64=("https://github.com/hrzlgnm/mdns-browser/releases/download/v1.20.4/mdns-browser_${pkgver}_amd64.deb" "https://github.com/hrzlgnm/mdns-browser/releases/download/v1.20.4/mdns-browser_linux_x64")
sha256sums_x86_64=('670cfb6680ca683086c06f2c90a1d6b1acaedacd12597e18ee09cd4ffc8d72a9' '9cf66cc3219883b5a939e88e5ef8f4e4915046e1d8f3955df8f6569ac4d9bc01')
package() {
    # The .deb contains the icons, .desktop file and other files installed to shared.
    tar -xz -f data.tar.gz -C "${pkgdir}"
    # The .deb contains a binary that has auto updates enabled for the .deb.
    # We install a unbundled version of the binary to have auto updates disabled.
    install -Dm755 mdns-browser_linux_x64 "${pkgdir}/usr/bin/mdns-browser"
}
