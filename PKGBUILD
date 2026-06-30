pkgname=dogma-bin
pkgver=2.1.1
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

sha256sums_x86_64=("4526d0a31b97dc442c531b6384a0ebd14b100d4704cb65d78413d80337eb5434")
sha256sums_aarch64=("52eeebd9b07302ab89eaa857be39a145894c6f76327cba6a2ca8ce3d12de012c")

package() {
  if [[ $CARCH == "x86_64" ]]; then
    tar -xzf "dogma-x86_64-$pkgver.tar.gz"
  elif [[ $CARCH == "aarch64" ]]; then
    tar -xzf "dogma-aarch64-$pkgver.tar.gz"
  fi
  install -Dm755 "dogma" "$pkgdir/usr/bin/dogma"
}
