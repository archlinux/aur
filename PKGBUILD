# Maintainer: Arthur Poulet (arthur.poulet@sceptique.eu)
pkgname=libcredid
pkgver=v0.3.5.r0.02b654e
pkgrel=1
pkgdesc="C Binding for credid client"
arch=('any')
url="https://github.com/Credid/c-credid-api"
license=('GPLv3')
groups=()
depends=()
makedepends=('cmake gcc')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('c-credid-api::git+https://github.com/Credid/c-credid-api')
#source=('c-credid-api.tar.gz::http://localhost/transfer_more_pkg/c-credid-api.tar.xz')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/c-credid-api"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/c-credid-api"
  make
}

package() {
  cd "$srcdir/c-credid-api"
  make PREFIX="$pkgdir/usr/local" install
}
