# Maintainer: eltonff <eltonfabricio10@gmail.com>
# BigTube — Universal Multimedia Downloader (Rust port: GTK4/libadwaita + GStreamer).
# Prebuilt binary package: the binaries are compiled once in CI and published as
# a GitHub Release asset, so installing does NOT compile anything on the user's
# machine.
pkgname=bigtube-bin
_pkgname=bigtube
pkgver=2.3.48
pkgrel=1
pkgdesc="Universal Multimedia Downloader (GTK4/libadwaita + GStreamer)"
arch=('x86_64')
url="https://github.com/eltonfabricio10/bigtube"
license=('MIT')
depends=('gtk4' 'libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good'
         'gst-plugins-bad' 'gst-plugin-gtk4' 'gst-plugin-va' 'yt-dlp')
optdepends=('ffmpeg: audio extraction and media conversion'
            'aria2: faster multi-connection downloads'
            'intel-media-driver: hardware video decode on Intel Gen9+ GPUs'
            'libva-intel-driver: hardware video decode on older Intel GPUs'
            'libva-mesa-driver: hardware video decode on AMD/other GPUs')
provides=('bigtube')
conflicts=('bigtube' 'bigtube-rs')
# Prebuilt tarball published by the release workflow (layout rooted at usr/).
source=("bigtube-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/bigtube-${pkgver}-x86_64.tar.gz")
sha256sums=('bce0f58e1a34ec7fe039403e25e471a4e41d68d5ecfb45ed348003a32874fb6e')

package() {
  # The tarball already mirrors the install layout (usr/bin, usr/share, ...).
  cp -a "${srcdir}/usr" "${pkgdir}/usr"
}
