pkgname=dogma-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Bridges secrets from vault backends and infrastructure outputs into sops-encrypted files deployed to NixOS machines (binary package)"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/dogma"
license=('MIT')
depends=('glibc')
provides=('dogma')
conflicts=('dogma')

source_x86_64=("dogma-x86_64-$pkgver.tar.gz::https://github.com/x71c9/dogma/releases/download/v$pkgver/dogma-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("dogma-aarch64-$pkgver.tar.gz::https://github.com/x71c9/dogma/releases/download/v$pkgver/dogma-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=("ac30a28d1701204979b4f4a8898657d41ab6deb7b66c6ea9af066b0cbef4ad9a")
sha256sums_aarch64=("149b6472799c5a09ae0ecd1099e89022c8d04444582387951a7b04c5430ef697")

package() {
  if [[ $CARCH == "x86_64" ]]; then
    tar -xzf "dogma-x86_64-$pkgver.tar.gz"
  elif [[ $CARCH == "aarch64" ]]; then
    tar -xzf "dogma-aarch64-$pkgver.tar.gz"
  fi
  install -Dm755 dogma "$pkgdir/usr/bin/dogma"
}
