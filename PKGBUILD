# Maintainer: Jonas Gierer <jgierer12@gmail.com>
pkgname=pocket-casts-linux-bin
pkgver=1.2.0
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
md5sums=('051d28a9f74472e229b2ce7a89b1be8f'
         '04bf690e790df16c6404870cdea950bc')

package() {
  mv "${srcdir}/usr" "${pkgdir}/usr"
  mv "${srcdir}/opt" "${pkgdir}/opt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
