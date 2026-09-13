# Maintainer: tassiovirginio <tassiovirginio@gmail.com>

pkgname=strata-bin
pkgver=0.16.0
pkgrel=1
pkgdesc='A fast, keyboard-first file manager for Linux'
arch=('x86_64' 'aarch64')
url='https://stratafiles.io/'
license=('MIT')
provides=('strata')
conflicts=('strata')
depends=(
  'bubblewrap'
  'desktop-file-utils'
  'ffmpeg'
  'ffmpegthumbnailer'
  'fontconfig'
  'gst-libav'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gtk4'
  'gtksourceview5'
  'gvfs'
  'poppler-glib'
  'xdg-utils'
)
optdepends=(
  'gvfs-smb: SMB network share support'
  'imagemagick: additional image preview support'
  'libraw: camera RAW preview support'
  'dcraw: camera RAW preview support'
)
source=(
  "https://github.com/lgse/strata/releases/download/v${pkgver}/strata-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
  "https://github.com/lgse/strata/releases/download/v${pkgver}/strata-${pkgver}-aarch64-unknown-linux-gnu.tar.gz"
)
sha256sums=(
  '51fa7095d8c5be993533d59b37d5224302a7c1fbed9ba81dcdc60ec5c04218ae'
  'c96d163931f97221fbdf8395b036e2d192a6a256e7dd9f5065c5f2bdf6819d2b'
)

package() {
  local _dir="strata-${pkgver}-${CARCH}-unknown-linux-gnu"

  cd "$srcdir/$_dir"

  install -Dm755 strata "$pkgdir/usr/bin/strata"
  install -Dm644 io.github.lgse.Strata.desktop "$pkgdir/usr/share/applications/io.github.lgse.Strata.desktop"
  install -Dm644 io.github.lgse.Strata.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.lgse.Strata.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY_LICENSES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES.md"
  install -Dm644 UnRAR.txt "$pkgdir/usr/share/licenses/$pkgname/UnRAR.txt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/portal-file-chooser.md "$pkgdir/usr/share/doc/$pkgname/portal-file-chooser.md"
  install -Dm644 io.github.lgse.Strata.FileManager1.service "$pkgdir/usr/share/doc/$pkgname/io.github.lgse.Strata.FileManager1.service"
}