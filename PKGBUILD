# Maintainer: Arthur Poulet (arthur.poulet@sceptique.eu)
pkgname=libcredid
pkgver=0.3.5
pkgrel=3
pkgdesc="C Binding for credid client"
arch=('any')
url="https://github.com/Credid/libcredid-client"
license=('GPLv3')
groups=()
depends=()
makedepends=('gcc make')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
#source=('c-credid-api::git+https://github.com/Credid/c-credid-api')
source=('libcredid-client.tar.gz::https://github.com/Credid/libcredid-client/archive/v0.3.5.tar.gz')
noextract=()
md5sums=('SKIP')

#pkgver() {
#  cd "$srcdir/c-credid-api"
#  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
#}

build() {
  cd "$srcdir/libcredid-client-$pkgver"
  make
}

package() {
  cd "$srcdir/libcredid-client-$pkgver"
  make PREFIX="$pkgdir/usr/local" install
}
