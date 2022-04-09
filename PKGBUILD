# Maintainer: Fuad Saud <fuadfsaud@gmail.com>
pkgname=pocket-casts-linux-bin
provides=('pocket-casts-linux')
conflicts=('pocket-casts-linux')
pkgver=1.4.0
pkgrel=1
pkgdesc="Electron wrapper around the Pocket Casts web app with support for MPRIS (media controls)"
arch=('x86_64')
license=('MIT')
url="https://github.com/fuadsaud/pocket-casts-linux"
depends=(
  'gtk3'
  'nss'
  'libxss'
)
source=(
  "https://github.com/fuadsaud/pocket-casts-linux/releases/download/v$pkgver/pocket-casts-linux-$pkgver-x64.pacman"
  "https://raw.githubusercontent.com/fuadsaud/pocket-casts-linux/v$pkgver/LICENSE"
)
md5sums=('d104503183f1689e0c6b889ca9081eb5'
         'd33641b160d63ec0a1de56f9f89fe400')

package() {
  cp --recursive $srcdir/{usr,opt} $pkgdir
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
