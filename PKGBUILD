# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=neon-wallet
pkgdesc='Lightweight Wallet for the NEO CryptoCurrency'
license=('MIT')
url='https://github.com/CityOfZion/neon-wallet'
pkgver=0.0.5
pkgrel=1
arch=('x86_64')

source_x86_64=(
  "${url}/releases/download/${pkgver}/Linux.Neon_${pkgver}_amd64.deb"
)
sha256sums_x86_64=(b581c54f9439c3eba5b1624e6ff075db255be18fc7b3ebe473d55802365458cb)

install=neon-wallet.install

package() {
  if [ "$CARCH" = "x86_64" ] ; then
    deb_arch="amd64"
  else
    echo "Unknown arch: $CARCH"
    exit 1
  fi

  cd "$srcdir"
  deb_package="Linux.Neon_${pkgver}_amd64.deb"
  ar xf "$deb_package"
  tar xf data.tar.xz -C "$pkgdir"
}

