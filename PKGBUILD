# Maintainer: Luke Bubar <luke at coldmail dot xyz>

pkgname=goatak-setup-archbased
# Upstream has no release tags yet: version is the date of the pinned commit.
pkgver=20261121
_commit=d3caaac2c4c1dc1afa92d21a173f1db50953ce69
pkgrel=1
pkgdesc="Interactive first-time setup for the GoATAK server: CA and server certificates, config, users, service and ATAK connection package"
arch=('any')
url="https://github.com/lukerb52/goatak-setup-archbased"
license=('unknown')
depends=(
  'bash'
  'goatak'
  'openssl'
  'curl'
  'iproute2'   # ss
  'procps-ng'  # pkill
  'gawk'
  'zip'
)
optdepends=(
  'sudo: run the steps that need root (or opendoas)'
  'opendoas: run the steps that need root (or sudo)'
  'ufw: open the TAK ports in ufw'
  'firewalld: open the TAK ports in firewalld'
  'inetutils: suggest the FQDN as the default hostname'
)
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('01d066e877426e53b87bb8920197474466a574607360959751c24a18a76e99f8')

package() {
  cd "$pkgname-$_commit"
  install -Dm755 goatak-setup.sh "$pkgdir/usr/bin/goatak-setup"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
