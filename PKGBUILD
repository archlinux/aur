# Maintainer: eltonff <eltonfabricio10@gmail.com>
# BigTube — Universal Multimedia Downloader (Rust port: GTK4/libadwaita + GStreamer).
# Prebuilt binary package: the binaries are compiled once in CI and published as
# a GitHub Release asset, so installing does NOT compile anything on the user's
# machine.
pkgname=bigtube-bin
_pkgname=bigtube
pkgver=2.1.93
pkgrel=1
pkgdesc="Universal Multimedia Downloader (GTK4/libadwaita + GStreamer)"
arch=('x86_64')
url="https://github.com/eltonfabricio10/bigtube"
license=('MIT')
depends=('gtk4' 'libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good'
         'gst-plugins-bad' 'gst-plugin-gtk4' 'yt-dlp')
optdepends=('ffmpeg: audio extraction and media conversion')
provides=('bigtube')
conflicts=('bigtube' 'bigtube-rs')
# Prebuilt tarball published by the release workflow (layout rooted at usr/).
source=("bigtube-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/bigtube-${pkgver}-x86_64.tar.gz")
sha256sums=('2c029296a0a3c3de06a48c1a550f5b7f3fe6b47c74644938bbf2656c4af7c1c3')

package() {
  # The tarball already mirrors the install layout (usr/bin, usr/share, ...).
  cp -a "${srcdir}/usr" "${pkgdir}/usr"
}
