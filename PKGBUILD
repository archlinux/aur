# Maintainer: Artjom Löbsack <me@ceigh.com>
pkgname=git-hours
pkgver=2.1.1
pkgrel=1
epoch=
pkgdesc='Count the time spent on code via git'
arch=('x86_64')
url='https://github.com/ceigh/git-hours'
license=('GPL3')
groups=()
depends=('libgit2')
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
source=("https://github.com/ceigh/$pkgname/archive/$pkgver.tar.gz")
noextract=()
md5sums=('fa38fe80cf01f7c2639e1e6a6f7b32fe')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
  mkdir -p -- $pkgdir/usr/{bin,local/man/man1}
	make PREFIX=$pkgdir/usr MAN_PREFIX=$pkgdir/usr/local/man install
}
