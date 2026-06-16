# Maintainer: Carlos Prieto <prietus@live.com> 
pkgname=murmur-bin
_pkgname=murmur
pkgver=0.4.0
pkgrel=1
pkgdesc='A native, opinionated IRC client. Subtle by default. IRCv3-ready. (prebuilt binary)'
arch=('x86_64')
url='https://github.com/prietus/murmur'
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=(
  'libxkbcommon'
  'fontconfig'
  'freetype2'
  'vulkan-icd-loader'
  'wayland'
  'gcc-libs'
  'glibc'
)
optdepends=(
  'hunspell-en_us: English autocomplete (ghost text)'
  'hunspell-es_es: Spanish autocomplete (ghost text)'
)
source_x86_64=(
  "$_pkgname-$pkgver-x86_64.tar.gz::https://github.com/prietus/murmur/releases/download/v$pkgver/murmur-x86_64-unknown-linux-gnu.tar.gz"
  "$_pkgname-$pkgver-extras.tar.gz::https://github.com/prietus/murmur/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums_x86_64=('6fb041a37f47569ce3848de0b951598ec19e1e064a99b860d9d05cfc64db22f5'
                   'abf1947bb8b2eff37ebaf7bd5c3530e07ab4d32dbb2f3e220bfc0f4ba36c1a3a')

package() {
  install -Dm755 "$srcdir/murmur" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/packaging/linux/murmur.desktop" \
    "$pkgdir/usr/share/applications/murmur.desktop"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/assets/icon.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/murmur.svg"
}
