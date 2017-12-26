# Maintainer: Arthur Poulet (arthur.poulet@sceptique.eu)
pkgname=transfer-more
pkgver=v0.3.2.r5.532f226
pkgrel=1
pkgdesc="Fast and lite file upload server (transfer.sh clone)"
arch=('any')
url="https://github.com/Nephos/transfer_more"
license=('GPLv3')
groups=()
depends=()
makedepends=('crystal' 'shards')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('transfer_more::git+https://github.com/Nephos/transfer_more')
#source=('transfer_more.tar.gz::http://localhost/transfer_more_pkg/transfer_more.tar.xz')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/transfer_more"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/transfer_more"
  make NAME="transfer-more" deps release
}

package() {
  cd "$srcdir/transfer_more"
  make PREFIX="$pkgdir/usr/local" NAME="transfer-more" install
}
