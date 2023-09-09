# Maintainer: Arthur Poulet (arthur.poulet@sceptique.eu)
pkgname=transfer-more
pkgver=v0.5.9
pkgrel=1
pkgdesc="Fast and lite file upload server (transfer.sh clone), git build."
arch=('any')
url="https://git.sceptique.eu/Sceptique/transfer_more"
license=('GPLv3')
groups=()
depends=()
makedepends=('crystal' 'shards' 'git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
# source=('transfer_more::git+https://git.sceptique.eu/Sceptique/transfer_more')
source=('transfer_more_v0.5.9.tar.gz::https://git.sceptique.eu/Sceptique/transfer_more/archive/v0.5.9.tar.gz')
noextract=()
sha256sums=('35c199f873c0f9e7f43c0a3ffa2a09e9771fa6accb757e31d83bbb28a4479ec3')

# pkgver() {
#   cd "$srcdir/transfer_more"
#   printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
# }

build() {
  cd "$srcdir/transfer_more"
  make NAME="transfer-more" deps release
}

# Note: the package files are supposed to be installed in /usr/bin/share/transfer-more
package() {
  cd "$srcdir/transfer_more"
  make PREFIX="$pkgdir/usr/share" NAME="transfer-more" install
}
