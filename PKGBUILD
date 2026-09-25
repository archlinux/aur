# Maintainer: tassiovirginio <tassiovirginio@gmail.com>

pkgname=strata-bin
pkgver=0.20.1
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
  'glibc>=2.39'
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
  'xdg-desktop-portal: use Strata for Open/Save file chooser dialogs'
  'udiskie: unlock encrypted volumes with Strata'
)
source_x86_64=(
  "https://github.com/lgse/strata/releases/download/v${pkgver}/strata-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums_x86_64=(
  '55f35eabb8006ddc8498cba59cdd3906ceda361ab583486ea5b61c8c6e4c2205'
)

source_aarch64=(
  "https://github.com/lgse/strata/releases/download/v${pkgver}/strata-${pkgver}-aarch64-unknown-linux-gnu.tar.gz"
)
sha256sums_aarch64=(
  'ca23fc3f452ec6a802935055a912393912d352a0648c97e68022aa24c698fb46'
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
  install -Dm644 io.github.lgse.Strata.FileManager1.service "$pkgdir/usr/share/dbus-1/services/io.github.lgse.Strata.FileManager1.service"
}
