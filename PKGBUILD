# Maintainer: rvid <contact@rvid.eu>
pkgname=reliquary-cli
pkgver=2
pkgrel=2
pkgdesc="CLI tool for communicating with the sanctum-based API, to help you manage your devices and shared secrets."
arch=('any')
depends=('jq' 'curl' 'sanctum' 'xxd')
optdepends=('confessions: peer to peer voice program to make reliquary voice calls' 'litany: peer-to-peer chat program')
url='https://reliquary.se'
source=('https://reliquary.se/reliquary-cli.tar')
sha256sums=('SKIP')

package() {
  cd "$srcdir"
  for bin in reliquary-*; do
    if [[ $bin != "reliquary-cli.tar" ]]; then
      install -Dm755 $bin "$pkgdir/usr/bin/$bin"
    fi
  done
}
