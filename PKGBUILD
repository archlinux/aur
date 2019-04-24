# Maintainer: Jonas Gierer <jgierer12@gmail.com>
pkgname=pocket-casts-linux-bin
provides=('pocket-casts-linux')
conflicts=('pocket-casts-linux')
pkgver=1.2.1
pkgrel=2
pkgdesc="Electron wrapper around the Pocket Casts web app with support for MPRIS (media controls)"
arch=('x86_64')
license=('MIT')
url="https://github.com/jgierer12/pocket-casts-linux"
depends=(
  'gtk3'
  'nss'
  'libxss'
)
source=(
  "https://github.com/jgierer12/pocket-casts-linux/releases/download/v$pkgver/pocket-casts-linux-$pkgver-x64.pacman"
  "https://raw.githubusercontent.com/jgierer12/pocket-casts-linux/v$pkgver/LICENSE"
)
md5sums=('be21aa678337da7d4a2f62c9b89dcf8c'
         '04bf690e790df16c6404870cdea950bc')

package() {
  cp --recursive $srcdir/{usr,opt} $pkgdir
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
