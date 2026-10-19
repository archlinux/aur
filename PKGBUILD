# Maintainer: vaishnav <vaishnav.sabari.girish@gmail.com>

pkgname=typepper-bin
_pkgname=typepper
pkgver=0.2.0
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
sha256sums_x86_64=('a72622c63dc5a82f545bd57755625c29444b5cac0f6947a35b3ab6f08d9e7dfa')
sha256sums_aarch64=('5c986dc87ee0f747aa4308848a775c2d962cbd42c4c858af3df9826d65d03e5b')

package() {
  cd "$srcdir/typepper-$CARCH-unknown-linux-gnu"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$_pkgname/CHANGELOG.md"
}
