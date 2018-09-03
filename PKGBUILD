# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=neon-wallet-bin
pkgdesc='Lightweight Wallet for the NEO CryptoCurrency'
license=('MIT')
url='https://github.com/CityOfZion/neon-wallet'
pkgver=0.2.8
pkgrel=1
arch=('x86_64')
deb_package="Neon-${pkgver}_amd64.Linux.deb"
source_x86_64=(
  "${url}/releases/download/${pkgver}/${deb_package}"
)
sha256sums_x86_64=(2a9a6cc1ee83e4af1ef36344a196d7ea6bb0d1c26c22e7f81b9e4b118b23d2d9)

install=neon-wallet-bin.install

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

