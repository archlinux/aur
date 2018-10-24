# Maintainer: hanss314 <hanss314@gmail.com>
pkgname=apush
pkgver=0.0.3
pkgrel=1
pkgdesc="A Potentially Useful SHell"
arch=('any')
url="https://gitlab.com/hanss314/apush"
license=('MIT')
groups=()
depends=()
makedepends=('make')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()

prepare() {
  git clone "$url" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  cd src
  sed -i "s/DESTDIR = \/usr\/local\/bin/DESTDIR = \/usr\/bin/" Makefile
}
build() {
  cd "$pkgname-$pkgver/src"
  make
}

package() {
  cd "$pkgname-$pkgver/src"
  mkdir -p "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir/usr/bin" install
}
