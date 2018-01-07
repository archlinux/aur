# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=neon-wallet
pkgdesc='Lightweight Wallet for the NEO CryptoCurrency'
license=('MIT')
url='https://github.com/CityOfZion/neon-wallet'
pkgver=0.0.9
pkgrel=1
arch=('x86_64')
deb_package="Neon_${pkgver}_amd64.Linux.deb"
source_x86_64=(
  "${url}/releases/download/${pkgver}/${deb_package}"
)
sha256sums_x86_64=(7eaebe3e9fa6d8394325efe3c768feedbc4703748c6c71fdb6ca0d68bd8cff17)

install=neon-wallet.install

package() {
  if [ "$CARCH" = "x86_64" ] ; then
    deb_arch="amd64"
  else
    echo "Unknown arch: $CARCH"
    exit 1
  fi

  cd "$srcdir"
  ar xf "$deb_package"
  tar xf data.tar.xz -C "$pkgdir"
}

