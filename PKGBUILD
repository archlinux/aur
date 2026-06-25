# Maintainer: SHORiN-KiWATA <fcl709@outlook.com>
pkgname=shorin-proton-wrapper-git
pkgver=r27.c5cf8fc
pkgrel=3
pkgdesc="Simple Proton wrapper for running Windows executables"
arch=('any')
url="https://github.com/SHORiN-KiWATA/proton-wrapper"
license=('MIT')
depends=('bash' 'python' 'python-gobject' 'gtk4' 'gamescope' 'icoextract' 'python-pillow' 'curl')
optdepends=(
  'steam: Steam runtime support'
  'lutris: Lutris runner support'
  'mangohud: performance overlay for --mangohud'
  'wget: alternative downloader'
  'lib32-alsa-lib: 32-bit ALSA audio support'
  'lib32-libpulse: 32-bit PulseAudio audio support'
  'lib32-alsa-plugins: 32-bit ALSA plugins for pure ALSA systems'
  'lib32-mpg123: 32-bit MP3 decoding'
  'lib32-libvorbis: 32-bit Vorbis decoding'
  'lib32-opus: 32-bit Opus decoding'
  'lib32-libvpx: 32-bit VP8/VP9 decoding'
  'lib32-gst-plugins-base-libs: 32-bit GStreamer media support (archlinuxcn)'
  'mpg123: MP3 decoding'
  'libvorbis: Vorbis decoding'
  'opus: Opus decoding'
  'libvpx: VP8/VP9 decoding'
  'ttf-liberation: Windows font metric compatibility'
)
makedepends=('git')
provides=('shorin-proton-wrapper')
conflicts=('shorin-proton-wrapper')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/proton-wrapper"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/proton-wrapper"
  install -Dm755 shorin-proton-wrapper "$pkgdir/usr/bin/shorin-proton-wrapper"
  install -Dm755 shorin-proton-wrapper-configure "$pkgdir/usr/bin/shorin-proton-wrapper-configure"
  install -Dm755 shorin-proton-wrapper-manager "$pkgdir/usr/bin/shorin-proton-wrapper-manager"
  install -Dm644 shorin-proton-wrapper-run-windows-program.desktop "$pkgdir/usr/share/applications/shorin-proton-wrapper-run-windows-program.desktop"
  install -Dm644 shorin-proton-wrapper-windows-program-configure.desktop "$pkgdir/usr/share/applications/shorin-proton-wrapper-windows-program-configure.desktop"
  install -Dm644 shorin-proton-wrapper-manager.desktop "$pkgdir/usr/share/applications/shorin-proton-wrapper-manager.desktop"
  install -Dm644 icons/shorin-proton.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/shorin-proton.png"
}
