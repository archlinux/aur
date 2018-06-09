# Maintainer: Tyler Johnson <mail@tyler-johnson.ca>
pkgname=fdic
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Dictionary filter for STDIN"
arch=('x86_64')
_reponame="dictionary-filter"
url="https://github.com/tejohnso/$_reponame"
license=('GPL')
groups=()
depends=('gcc-libs')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/tejohnso/dictionary-filter/archive/$pkgver.tar.gz")
md5sums=("SKIP")
noextract=()

build() {
	cd "$_reponame-$pkgver"
  g++ -Wall -o fdic fdic.cpp dictionary.cpp
}

check() {
	cd "$_reponame-$pkgver"
  file -E fdic
}

package() {
	cd "$_reponame-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
	cp fdic "$pkgdir/usr/bin"
}
