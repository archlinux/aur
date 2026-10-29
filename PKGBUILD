# Maintainer: Novaturiente
# pkgver and sha256sums are filled in by packaging/release.sh
pkgname=novabrowser-webkit-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Keyboard-driven browser on WebKitGTK 6.0, configured in TypeScript (prebuilt)"
arch=(x86_64)
url="https://github.com/Novaturiente/novabrowser-webkit"
license=(GPL-3.0-or-later)
depends=(libwebkitgtk-6.0.so gtk4 glib2 sqlite curl gst-plugins-base gst-plugins-good)
optdepends=('webkitgtk-6.0-nova-bin: our WebKitGTK build (Chromium-like dark mode, PGO, AVX2 CPUs)'
            'gst-libav: H.264/AAC and most web video'
            'gst-plugins-bad: more codecs (AV1, HLS)'
            'gst-plugin-va: hardware video decoding'
            'aria2: faster downloads (8 connections), resume after restart, magnet links and torrents'
            'rbw: Bitwarden passwords'
            'pass: password-store passwords'
            'bitwarden-cli: Bitwarden passwords (bw)'
            'xdg-utils: download-open and default-browser setup')
provides=(novabrowser-webkit)
conflicts=(novabrowser-webkit novabrowser-webkit-git)
options=(!strip !debug)
# The /usr tree of the `novabrowser-webkit` package, built by packaging/release.sh
source=("novabrowser-webkit-$pkgver-x86_64.tar.zst::$url/releases/download/v$pkgver/novabrowser-webkit-$pkgver-x86_64.tar.zst")
sha256sums=('8be0ef35193666052cde318af48c530f855e5bf85290cdf6a4f0f22cdf0816f3')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
