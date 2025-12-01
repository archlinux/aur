# Maintainer: Valentin Batz <valentin.batz+archlinux@posteo.de>
pkgname=mdns-browser-bin
pkgver=0.28.1
pkgrel=1
pkgdesc="A cross platform mDNS browsing app written in Rust using tauri and leptos "
arch=('x86_64')
url="https://github.com/hrzlgnm/mdns-browser"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
conflicts=('mdns-browser')
source_x86_64=("https://github.com/hrzlgnm/mdns-browser/releases/download/mdns-browser-v$pkgver/mdns-browser_${pkgver}_amd64.deb")
sha256sums_x86_64=('13df8ccf7b6f7507653ca87f4e57cafc38f1812967ca92a6d9181460e2051514')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
    # Explicitly strip only the binary; !strip in options prevents makepkg's auto-strip phase which also generates 
    # a debug package, which is useless here, as the debug information only contains symbols and no debug info
    strip "${pkgdir}/usr/bin/mdns-browser"
}
