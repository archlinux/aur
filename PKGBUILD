# Maintainer: zhtlancer <zhtlancer@gmail.com>

pkgname=strata-fm-pre-bin
_pkgver=0.22.0-rc.1
pkgver=0.22.0rc1
pkgrel=1
pkgdesc='A fast, keyboard-first file manager for Linux (pre-release binary)'
arch=('x86_64' 'aarch64')
url='https://stratafiles.io/'
license=('MIT')
provides=('strata' 'strata-fm')
conflicts=('strata-bin' 'strata-fm-git')
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
  "https://github.com/lgse/strata/releases/download/v${_pkgver}/strata-${_pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums_x86_64=(
  '84119e858ada4a9994f0c7d90ee5db1310c2406643fc030bd8423f16d7e28ed8'
)

source_aarch64=(
  "https://github.com/lgse/strata/releases/download/v${_pkgver}/strata-${_pkgver}-aarch64-unknown-linux-gnu.tar.gz"
)
sha256sums_aarch64=(
  'ec52f00699cd575e23b67f226bf08a637b352a4e26dc759db8b7d4ca6292a058'
)

package() {
  local _dir="strata-${_pkgver}-${CARCH}-unknown-linux-gnu"

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
