pkgname=dogma-bin
pkgver=1.9.0
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

sha256sums_x86_64=("16b3d74776e01dc0baeddf44cb9978c34fcce43724c24a06fc5ab791c1d2c4c9")
sha256sums_aarch64=("4604c46ff7691a15f0610fd7f9db3573c1d2a54caca5d2be23b0a9849879afd0")

package() {
  if [[ $CARCH == "x86_64" ]]; then
    tar -xzf "dogma-x86_64-$pkgver.tar.gz"
  elif [[ $CARCH == "aarch64" ]]; then
    tar -xzf "dogma-aarch64-$pkgver.tar.gz"
  fi
  install -Dm755 dogma "$pkgdir/usr/bin/dogma"
}
