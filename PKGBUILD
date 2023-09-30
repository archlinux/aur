# Maintainer: Your Name <youremail@domain.com>
pkgname=rust-analyzer-up
pkgver=1.0
pkgrel=1
pkgdesc="Bash script to manual update rust-analyzer from repository."
arch=(any)
url=""
license=('MIT')
groups=()
depends=(curl)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=() #autofill using updpkgsums

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
