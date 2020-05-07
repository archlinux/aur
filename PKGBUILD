# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=neon-wallet-bin
pkgdesc='Lightweight Wallet for the NEO CryptoCurrency'
license=('MIT')
url='https://github.com/CityOfZion/neon-wallet'
pkgver=2.5.0
pkgrel=1
arch=('x86_64')
deb_package="Neon-${pkgver}_amd64.Linux.deb"
source_x86_64=(
  "${url}/releases/download/${pkgver}/${deb_package}"
)
sha256sums_x86_64=(e7e90dd686a9028b56d9c5326b79099d6ac6831412b482d0bcdfbbb888e11102)

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

