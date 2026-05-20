# Maintainer: Carlos Prieto <cprieto.ortiz@gmail.com>
pkgname=murmur-bin
_pkgname=murmur
pkgver=0.2.1
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
sha256sums_x86_64=('b73f4068568f2445be084e12e83c1680e3e5ef4dda1fc48a5b49c1cad8629530'
                   '4c940ee248212a02983c99cb9068c61438f5a4e4f476f114b1b0e2a4ca474cf5')

package() {
  install -Dm755 "$srcdir/murmur" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/packaging/linux/murmur.desktop" \
    "$pkgdir/usr/share/applications/murmur.desktop"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/assets/icon.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/murmur.svg"
}
