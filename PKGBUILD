# Maintainer: Pablo Gómez Poch <pablogomez [at] pablogomez [dot] com>
# Contributor: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=neon-wallet-bin
pkgdesc='Lightweight Wallet for the NEO CryptoCurrency'
license=('MIT')
url='https://github.com/CityOfZion/neon-wallet'
pkgver=2.11.0
pkgrel=1
arch=('x86_64')
deb_package="Neon.${pkgver}.deb"
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${deb_package}"
)
sha256sums_x86_64=(61d52c4f3187e57c523675eba51157b458d35dd62570f42b3d185d3016fe65fa)

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
