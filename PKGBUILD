# Maintainer: Remenod <remenod@gmail.com>
# Built from the telegram-desktop-export package by Remenod/telegram-desktop-export
# (GitHub Actions, packaging branch) and published there.

pkgname=telegram-desktop-export-bin
pkgver=7.4.4
pkgrel=2
pkgdesc='Telegram Desktop with export patches: media reused between exports, size limits per media type, no hangs on lost media'
arch=('x86_64')
url='https://github.com/Remenod/telegram-desktop-export'
license=(
  'GPL-3.0-or-later WITH OpenSSL-exception'
)
depends=(
  'abseil-cpp'
  'ada'
  'cairo'
  'ffmpeg'
  'fontconfig'
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'hunspell'
  'kcoreaddons'
  'libavif'
  'libfido2'
  'libgcc'
  'libheif'
  'libjpeg-turbo'
  'libjxl'
  'libpipewire'
  'libsrtp'
  'libstdc++'
  'libvpx'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxtst'
  'lz4'
  'minizip'
  'openal'
  'openh264'
  'openssl'
  'opus'
  'pango'
  'pipewire'
  'qt6-base'
  'qt6-declarative'
  'qt6-imageformats'
  'qt6-svg'
  'qt6-wayland'
  'rnnoise'
  'tlottie'
  'xxhash'
  'zlib'
)
optdepends=(
  'geoclue: geoinformation support'
  'crow-translate: translation provider'
  'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1 (gtk3)'
  'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (gtk4)'
  'xdg-desktop-portal: desktop integration'
)
provides=('telegram-desktop' 'telegram-desktop-export')
conflicts=('telegram-desktop' 'telegram-desktop-export')
options=('!strip' '!debug')
source_x86_64=("https://github.com/Remenod/telegram-desktop-export/releases/download/pkg-$pkgver-$pkgrel/telegram-desktop-export-$pkgver-$pkgrel-$CARCH.pkg.tar.zst")
noextract=("telegram-desktop-export-$pkgver-$pkgrel-$CARCH.pkg.tar.zst")
sha512sums_x86_64=('15b03e8cfc26fae171248eea4fd56fae91ea7ed6547e860a6c3a5da5d6c1fa83485036b935b534cbf7ba4dd97dbc7268250130271a4c2a626705fddbb063f44b')

package() {
  bsdtar -xf "$srcdir/telegram-desktop-export-$pkgver-$pkgrel-$CARCH.pkg.tar.zst" -C "$pkgdir" \
    --exclude=.PKGINFO --exclude=.BUILDINFO --exclude=.MTREE \
    --exclude=.INSTALL
}
