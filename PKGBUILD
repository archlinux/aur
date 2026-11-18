# Maintainer: Novaturiente
# pkgver and sha256sums are filled in by packaging/release.sh
pkgname=novabrowser-webkit-bin
pkgver=0.1.20
pkgrel=1
pkgdesc="Keyboard-driven browser on WebKitGTK 6.0, configured in TypeScript (prebuilt)"
arch=(x86_64)
url="https://github.com/Novaturiente/novabrowser-webkit"
license=(GPL-3.0-or-later MPL-2.0)  # MPL: vendored webauthn-authenticator-rs (passkeys)
depends=(libwebkitgtk-6.0.so gtk4 libadwaita glib2 sqlite curl gst-plugins-base gst-plugins-good openssl dbus)
optdepends=('webkitgtk-6.0-nova-bin: our WebKitGTK build (Chromium-like dark mode, PGO, AVX2 CPUs)'
            'gst-libav: H.264/AAC and most web video'
            'gst-plugins-bad: more codecs (AV1, HLS)'
            'gst-plugin-va: hardware video decoding'
            'aria2: faster downloads (8 connections), resume after restart, magnet links and torrents'
            'rbw: Bitwarden passwords'
            'pass: password-store passwords'
            'bitwarden-cli: Bitwarden passwords (bw)'
            'xdg-utils: download-open and default-browser setup'
            'bluez: passkeys from your phone (Bluetooth)')
provides=(novabrowser-webkit)
conflicts=(novabrowser-webkit novabrowser-webkit-git)
options=(!strip !debug)
# The /usr tree of the `novabrowser-webkit` package, built by packaging/release.sh
source=("novabrowser-webkit-$pkgver-x86_64.tar.zst::$url/releases/download/v$pkgver/novabrowser-webkit-$pkgver-x86_64.tar.zst")
sha256sums=('f0e68b5e821352f9ee449b0328af995e20694f5c43556c034a8b36ce71a8952d')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}