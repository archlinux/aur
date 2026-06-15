# Maintainer: eltonff <eltonfabricio10@gmail.com>
# BigTube — Universal Multimedia Downloader (Rust port: GTK4/libadwaita + GStreamer).
#
# NOTE: This package now ships PREBUILT binaries (compiled once in CI and
# published as a GitHub Release asset), so installing does NOT compile anything
# on your machine. It is being merged into `bigtube-bin`; please switch to that
# package. This binary PKGBUILD is a stop-gap so existing users stop compiling.
pkgname=bigtube
_pkgname=python-bigtube
pkgver=2.0.66
pkgrel=1
pkgdesc="Universal Multimedia Downloader (GTK4/libadwaita + GStreamer)"
arch=('x86_64')
url="https://github.com/eltonfabricio10/python-bigtube"
license=('MIT')
depends=('gtk4' 'libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good'
         'gst-plugins-bad' 'gst-plugin-gtk4' 'yt-dlp')
optdepends=('ffmpeg: audio extraction and media conversion')
provides=('bigtube-bin')
conflicts=('bigtube-bin' 'bigtube-rs')
# Prebuilt tarball published by the release workflow (layout rooted at usr/).
source=("bigtube-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/bigtube-${pkgver}-x86_64.tar.gz")
sha256sums=('c812a2f4f2f1776497d92cfdf2012de65b9945608f338ac58d6122f2ddff1a4a')

package() {
  # The tarball already mirrors the install layout (usr/bin, usr/share, ...).
  cp -a "${srcdir}/usr" "${pkgdir}/usr"
}
