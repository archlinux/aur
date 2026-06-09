# Maintainer: Carlos Prieto <prietus@live.com> 
pkgname=murmur-bin
_pkgname=murmur
pkgver=0.3.9
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
sha256sums_x86_64=('736b7e74ede47a447d2ebf8288474864ea317c1b76f90caf48c2c05a49e6d3f5'
                   '6ab845a82cd44f660863874d32f4f6fe691b427a9e9bbb31f80b694110104044')
package() {
  install -Dm755 "$srcdir/murmur" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/packaging/linux/murmur.desktop" \
    "$pkgdir/usr/share/applications/murmur.desktop"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/assets/icon.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/murmur.svg"
}
