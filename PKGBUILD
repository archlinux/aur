pkgname=audium
pkgver=1.1.0
pkgrel=1
pkgdesc="A keyboard-driven music app for people who live in the terminal."
arch=('x86_64')
url="https://github.com/takashialpha/audium"
license=('Apache-2.0')
depends=('alsa-lib' 'alsa-utils')

source=("https://github.com/takashialpha/audium/releases/download/v${pkgver}/audium-v${pkgver}-x86_64-linux.tar.gz"
"LICENSE::https://raw.githubusercontent.com/takashialpha/audium/v${pkgver}/LICENSE")
sha256sums=('SKIP' 'SKIP')

package() {
  cd "$srcdir"

  # Install the binary
  install -Dm755 audium-x86_64-unknown-linux-gnu "$pkgdir/usr/bin/audium"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
