pkgname=beditor-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Video editing software, Can run on Windows, Linux, and macOS."
arch=('x86_64')
url="https://github.com/b-editor/BEditor"
license=('MIT')
depends=(
  ffmpeg
  gstreamer
  gtk2
  gtk3
  harfbuzz
  hdf5
  jasper
  libdc1394
  libwebp
  openal
  openexr
  tesseract
  dotnet-targeting-pack-bin 
)

source=("https://github.com/b-editor/BEditor/releases/download/v${pkgver}/beditor_${pkgver}-1_amd64.deb")
sha512sums=("SKIP")

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  # Fix Icon Path
  sed -i "s@Icon=/usr/share/pixmaps/beditor_icon.png@Icon=/usr/share/icons/hicolor/scalable/apps/beditor.png@" "${pkgdir}/usr/share/applications/beditor.desktop"
  install -Dm644 "${pkgdir}/usr/share/pixmaps/beditor_icon.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/beditor.png"
  rm -r "${pkgdir}/usr/share/pixmaps"
}
