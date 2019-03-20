# Maintainer: Jonas Gierer <jgierer12@gmail.com>
pkgname=pocket-casts-linux-bin
pkgver=1.1.0
pkgrel=1
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
md5sums=('8f07b49aebffac1bc6d1af0017cdfbd0'
         '33b6298b0e0e6506f656593f828f958e')

package() {
  mv "${srcdir}/usr" "${pkgdir}/usr"
  mv "${srcdir}/opt" "${pkgdir}/opt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
