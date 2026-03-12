# Maintainer: sin
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=yt-dlp-nightly-bin
_pkgname=yt-dlp
pkgver=2026.03.11.233532
pkgrel=1
pkgdesc='A youtube-dl fork with additional features and fixes (Nightly binary build)'
arch=('any')
url='https://github.com/yt-dlp/yt-dlp-nightly-builds'
license=('Unlicense')
# The binary release (zipapp) bundles its own libs, usually only requires the interpreter
depends=('python')
# We conflict with the repo version and the git version
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")

optdepends=('ffmpeg: for video post-processing'
  'rtmpdump: for rtmp streams support'
  'atomicparsley: for embedding thumbnails into m4a files'
  'aria2: for using aria2 as external downloader'
  'python-mutagen: for embedding thumbnail in certain formats'
  'python-pycryptodome: for decrypting AES-128 HLS streams and various other data'
  'python-pycryptodomex: for decrypting AES-128 HLS streams and various other data'
  'python-websockets: for downloading over websocket'
  'python-brotli: brotli content encoding support'
  'python-brotlicffi: brotli content encoding support'
  'python-xattr: for writing xattr metadata'
  'python-pyxattr: for writing xattr metadata (alternative option)'
  'phantomjs: for extractors with javascript code'
  'python-secretstorage: For -cookies-from-browser to access the GNOME keyring while decrypting cookies of Chromium-based browsers'
  'yt-dlp-ejs: non-deprecated YouTube support'
  # JS Engines for Javascript Challenges (PO Token, etc)
  'nodejs: for extractors with javascript code (recommended)'
  'deno: for extractors with javascript code'
  'bun: for extractors with javascript code'
  'quickjs: for extractors with javascript code'
  'phantomjs: for extractors with javascript code (deprecated)')

source=("$_pkgname-$pkgver::https://github.com/yt-dlp/yt-dlp-nightly-builds/releases/download/$pkgver/yt-dlp")
sha256sums=('b967ffefb644f1ff0f97ccf06dbe1307446d85b78c1a5535ed527a5d368d4813')

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
