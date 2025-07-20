# Maintainer: Geoffrey Teale <tealeg@gmail.com>
_name=goblins
pkgname=guile-$_name
pkgver=0.15.1
pkgrel=1
pkgdesc="Spritely Goblins is a distributed object programming environment for Guile Scheme."
arch=(any)
url="https://spritely.institute/goblins/"
license=('Apache')
groups=()
depends=("guile>=3.0", "guile-gcrypt>=0.3.0", "guile-fibers>=1.0.0" "guile-gnutls>=4.0" "guile-websocket>=0.2")
makedepends=("guile>=3.0", "guile-gcrypt>=0.3.0", "guile-fibers>=1.0.0" "guile-gnutls>=4.0" "guile-websocket>=0.2")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://spritely.institute/files/releases/$pkgname/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('b20a7b49f21dce6c18d5b0e2fe08eeef')

build() {
  cd "$pkgname-$pkgver"
  
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
