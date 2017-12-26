# Maintainer: Arthur Poulet (arthur.poulet@sceptique.eu)
pkgname=transfer-more
pkgver=v0.3.2.r3.d21502b
pkgrel=2
pkgdesc="transfer.sh clone in Crystal-lang based on kemalcr"
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
  make deps release
}

package() {
  cd "$srcdir/transfer_more"
  make PREFIX="$pkgdir/usr/local" install
}
