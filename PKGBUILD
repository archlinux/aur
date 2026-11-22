# Maintainer: Denis Kopin <deng@lixun.app>
pkgname=lixun-bin
_pkgname=lixun
pkgver=0.7.10
pkgrel=1
pkgdesc="Spotlight-like launcher for Linux (core: daemon, gui, cli, preview)"
arch=('x86_64')
url="https://lixun.app"
license=('MIT OR Apache-2.0')
options=(!debug !strip)
depends=(
  'gtk4'
  'gtk4-layer-shell'
  'xdg-utils'
  'poppler-glib'
  'zstd'
  'sqlite'
  'gcc-libs'
  'xz'
  'libheif'
)
optdepends=(
  'lixun-semantic: dense-vector hybrid retrieval via the sidecar worker'
  'lixun-ocr: OCR for scanned PDFs and images via tesseract'
  'antiword: legacy .doc preview'
  'catdoc: legacy .xls/.ppt preview'
  'libreoffice-fresh: full office-suite preview'
  'gst-plugins-good: audio/video preview'
  'gst-plugins-bad: extra audio/video codecs'
  'gst-plugins-ugly: extra audio/video codecs'
  'gst-libav: ffmpeg-backed codec coverage'
  'xdg-terminal-exec: terminal-launching shell hits'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" 'lupa' 'lupa-bin')
_archive="${_pkgname}-$pkgver-1-x86_64.pkg.tar.zst"
source=("https://github.com/dengkeping/lixun/releases/download/v$pkgver/$_archive")
noextract=("$_archive")
sha256sums=('202f640f15d09d80339f5763ef5ac5916d34ac68be7dde88ea01bfc9cda43498')

package() {
  bsdtar -xf "$srcdir/$_archive" -C "$pkgdir" usr
  ln -s "$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"
}
