# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=neon-wallet
pkgdesc='Lightweight Wallet for the NEO CryptoCurrency'
license=('MIT')
url='https://github.com/CityOfZion/neon-wallet'
pkgver=0.0.6
pkgrel=1
arch=('x86_64')

source_x86_64=(
  "${url}/releases/download/${pkgver}/Linux.Neon_${pkgver}_amd64.deb"
)
sha256sums_x86_64=(a718f352cbd66e1f3e67591d21127c48d3491d279b98b62aa35b61533362617c)

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

