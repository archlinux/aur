# Maintainer: Pablo Gómez Poch <pablogomez [at] pablogomez [dot] com>
# Contributor: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=neon-wallet-bin
pkgdesc='Lightweight Wallet for the NEO CryptoCurrency'
license=('MIT')
url='https://github.com/CityOfZion/neon-wallet'
pkgver=2.9.4
pkgrel=1
arch=('x86_64')
deb_package="Neon.${pkgver}.deb"
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${deb_package}"
)
sha256sums_x86_64=(1da7ec6331f92a0853d2c3c07dc4bcfe85cd6ae94104c2d41dd974a6c52d8017)

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
