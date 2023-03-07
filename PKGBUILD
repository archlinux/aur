# Maintainer: Geoffrey Teale <tealeg@gmail.com>
_name=goblins
pkgname=guile-$_name
pkgver=0.10
pkgrel=1
pkgdesc="Spritely Goblins is a distributed object programming environment for Guile Scheme."
arch=(any)
url="https://spritely.institute/goblins/"
license=('Apache')
groups=()
depends=("guile>=3.0", "guile-gcrypt>=0.3.0", "guile-fibers>=1.0.0")
makedepends=("guile>=3.0", "guile-gcrypt>=0.3.0", "guile-fibers>=1.0.0")
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
md5sums=("8ea95ea89da3edff129017bc82405ad6") #autofill using updpkgsums

build() {
  cd "$pkgname-$pkgver"
  
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
