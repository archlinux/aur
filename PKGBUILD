# Maintainer: Arthur Poulet (arthur.poulet@sceptique.eu)
pkgname=transfer-more
pkgver=v0.5.8
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
source=('transfer_more_v0.5.8.tar.gz::https://git.sceptique.eu/Sceptique/transfer_more/archive/v0.5.8.tar.gz')
noextract=()
sha256sums=('fbac71f53595e86fe122d564a4e3f51b95d6571de910dc5c8708342b9fdf4765')

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
