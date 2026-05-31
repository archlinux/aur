# Maintainer: Carlos Prieto <cprieto.ortiz@gmail.com>
pkgname=murmur-bin
_pkgname=murmur
pkgver=0.3.3
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
source_x86_64=(
  "$_pkgname-$pkgver-x86_64.tar.gz::https://github.com/prietus/murmur/releases/download/v$pkgver/murmur-x86_64-unknown-linux-gnu.tar.gz"
  "$_pkgname-$pkgver-extras.tar.gz::https://github.com/prietus/murmur/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums_x86_64=('86de6cd3b6b1d92ff84bd94b8a463093c5fc242c16dd17466de4b300953f84f5'
                   'ffdc5522f4c6bcb52f8b5b0811472733a859ccfb96928fa377ab6ac2582d5d01')

package() {
  install -Dm755 "$srcdir/murmur" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/packaging/linux/murmur.desktop" \
    "$pkgdir/usr/share/applications/murmur.desktop"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/assets/icon.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/murmur.svg"
}
