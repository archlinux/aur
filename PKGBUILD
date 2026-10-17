# Maintainer: Christian Helle <christian.helle@outlook.com>

pkgname=airdash-bin
_pkgname=airdash
pkgver=0.1.0
pkgrel=1
pkgdesc="Desktop dashboard for Airthings air quality monitors"
arch=('x86_64' 'aarch64')
url="https://github.com/christianhelle/airdash"
license=('MIT')
# The window and OpenGL libraries are loaded at runtime rather than linked.
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libglvnd' 'libxkbcommon' 'wayland')
optdepends=(
  'libx11: run in an X11 session'
  'libxcursor: run in an X11 session'
  'libxi: run in an X11 session'
  'libxkbcommon-x11: run in an X11 session'
  'libxrender: run in an X11 session'
  'gnome-keyring: keep the Airthings sign-in in the Secret Service instead of a file'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/christianhelle/airdash/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('a7b8e060d1b4b63ea419377a408d43b785664836de24407e96e7805f838958ee')
sha256sums_x86_64=('c3425f9f7426803cddc333ad79fb694a7e91ed85633216891f73376bbbcc1b29')
sha256sums_aarch64=('4f8ebf5b1894f3ded4d4a8758ffbc7275679c54f4564cf98628e621a89d51ef6')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/com.christianhelle.airdash.desktop" \
    "$pkgdir/usr/share/applications/com.christianhelle.airdash.desktop"
  install -Dm644 "$srcdir/com.christianhelle.airdash.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.christianhelle.airdash.png"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
