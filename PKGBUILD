# Maintainer: vaishnav <vaishnav.sabari.girish@gmail.com>

pkgname=typepper-bin
_pkgname=typepper
pkgver=0.6.0
pkgrel=1
pkgdesc='A spicy little typing game for your terminal and browser (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://typepper.com/'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip')
_rel="https://github.com/leodiegues/typepper/releases/download/v$pkgver"
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.xz::$_rel/typepper-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.xz::$_rel/typepper-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('7246fb1508c1155d0ac797750a1c1cb322ed3c47e0a2f0d26f6eca01e930a84a')
sha256sums_aarch64=('0f614a417a733206a43410d4ac8b6f9c67077540fd88fcbf35489ea45b0db805')

package() {
  cd "$srcdir/typepper-$CARCH-unknown-linux-gnu"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$_pkgname/CHANGELOG.md"
}
