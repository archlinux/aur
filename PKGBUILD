# Maintainer: Luke Bubar <luke at coldmail dot xyz>

pkgname=goatak-setup-archbased
# Upstream has no release tags yet: version is the date of the pinned commit.
pkgver=20261103
_commit=43e7c1fdd5eb77d4b5edf3012922fd71eb208723
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
sha256sums=('a1442892e4c84fdd0aaae7b691dd497f91ff090efef9a1aa60186480334fcca3')

package() {
  cd "$pkgname-$_commit"
  install -Dm755 goatak-setup.sh "$pkgdir/usr/bin/goatak-setup"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
