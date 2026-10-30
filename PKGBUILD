# Maintainer: Novaturiente
# pkgver and sha256sums are filled in by packaging/release.sh
pkgname=novabrowser-webkit-bin
pkgver=0.1.7
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
sha256sums=('77f9456530e36fb45eeba8e883dfee31488361ba235bee7e5d1cc36e9b4474b5')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
