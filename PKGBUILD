# Maintainer: David Barri <japgolly@gmail.com>
pkgname=vertcoin-bin
pkgver=0.17.1
pkgrel=2
pkgdesc="A digital currency with mining decentralisation and ASIC resistance as a key focus."
arch=('x86_64')
url="https://github.com/vertcoin-project/vertcoin-core"
license=('MIT')
source=("https://github.com/vertcoin-project/vertcoin-core/releases/download/$pkgver/vertcoind-v$pkgver-linux-amd64.zip"
        "https://github.com/vertcoin-project/vertcoin-core/releases/download/$pkgver/vertcoind-v$pkgver-linux-amd64.zip.sig")
sha256sums=('d46cbb903d23b09a52b9c1c925ba73995d31d298189f585775d29bc66e7fb699'
            'SKIP')
validpgpkeys=('64D9042053AA1391D6C0B4A7425776E2F9E5BAB8')
provides=('vertcoin')
conflicts=('vertcoin')

package() {
  set -eu
  cmake .
  mkdir -p "$pkgdir/usr/bin"
  install \
    vertcoind-tx \
    vertcoind-cli \
    vertcoind-wallet \
    "$pkgdir/usr/bin"
}
