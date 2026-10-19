# Maintainer: Valentin Batz <valentin.batz+archlinux@posteo.de>
pkgname=mdns-browser-bin
pkgver=2.9.3
pkgrel=1
pkgdesc="A cross platform mDNS browsing app written in Rust using tauri and svelte "
arch=('x86_64')
url="https://github.com/hrzlgnm/mdns-browser"
license=('MIT' 'OFL-1.1')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
conflicts=('mdns-browser')
source_x86_64=("https://github.com/hrzlgnm/mdns-browser/releases/download/v2.9.3/mdns-browser_${pkgver}_amd64.deb" "https://github.com/hrzlgnm/mdns-browser/releases/download/v2.9.3/mdns-browser_linux_x64")
sha256sums_x86_64=('6a9bd05731c07467740f4410468430f94041dd2ef3a69dd1cc1327814768c42e' '7afcbbca1cc10f9e2f0b2135dfd9a0a0e71708a1ecb6bc600ec82d6c65d2c523')
package() {
    # The .deb contains the icons, .desktop file and other files installed to shared.
    tar -xz -f data.tar.gz -C "${pkgdir}"
    # The .deb contains a binary that has auto updates enabled for the .deb.
    # We install a unbundled version of the binary to have auto updates disabled.
    install -Dm755 mdns-browser_linux_x64 "${pkgdir}/usr/bin/mdns-browser"
}
