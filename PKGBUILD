# Maintainer: rvid <contact@rvid.eu>
pkgname=reliquary-cli
pkgver=1
pkgrel=1
pkgdesc="CLI tool for communicating with the sanctum-based API, to help you manage your devices and shared secrets."
arch=('any')
depends=('jq' 'curl') # sanctum
optdepends=('confessions: peer to peer voice program to make reliquary voice calls' 'litany: peer-to-peer chat program')
url='https://reliquary.se'
source=('https://reliquary.se/reliquary-cli.tar')
sha256sums=('78176ca90749b7fff8df0b886df6f7d878d18dab713415d18f59ec29f505b2f6')

package() {
  cd "$srcdir"
  for bin in reliquary-*; do
    if [[ $bin != "reliquary-cli.tar" ]]; then
      install -Dm755 $bin "$pkgdir/usr/bin/$bin"
    fi
  done
}
