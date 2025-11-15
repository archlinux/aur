# Maintainer: Valentin Batz <valentin.batz+archlinux@posteo.de>
pkgname=mdns-browser-bin
pkgver=0.26.8
pkgrel=1
pkgdesc="A cross platform mDNS-Browser app written in Rust using tauri and leptos "
arch=('x86_64')
url="https://github.com/hrzlgnm/mdns-browser"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
conflicts=('mdns-browser')
source_x86_64=("https://github.com/hrzlgnm/mdns-browser/releases/download/mdns-browser-v$pkgver/mdns-browser_${pkgver}_amd64.deb")
sha256sums_x86_64=('c1323435d91ae7c3cecb39db08c6625342fe580aa71d21c48f0a59e06b8e65d9')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
    # Explicitly strip only the binary; !strip in options prevents makepkg's auto-strip phase which also generates 
    # a debug package, which is useless here, as the debug information only contains symbols and no debug info
    strip "${pkgdir}/usr/bin/mdns-browser"
}
