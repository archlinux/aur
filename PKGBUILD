# Maintainer: Carlos Prieto <cprieto.ortiz@gmail.com>
pkgname=murmur-bin
_pkgname=murmur
pkgver=0.2.7
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
sha256sums_x86_64=('ffb6a92ce82339eb975f13084a0b34e4a542e6e87f4823462dc536479b835b6b'
                   '960f457774129c61fccbfd076a86f846206b0673036081ad781a2eed6c7b44bb')

package() {
  install -Dm755 "$srcdir/murmur" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/packaging/linux/murmur.desktop" \
    "$pkgdir/usr/share/applications/murmur.desktop"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/assets/icon.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/murmur.svg"
}
