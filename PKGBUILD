# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

pkgname=perspector
_commit=413252afcbd2a0c952c22d1f868201ad282e4ec8
pkgver=1.2
pkgrel=5
pkgdesc="A control-point-based perspective rectification tool"
arch=("i686" "x86_64")
url="https://ambrevar.xyz/$pkgname"
license=("MIT")
depends=("gsl" "gtk3")
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/Ambrevar/perspector/repository/archive.tar.gz?ref=$_commit")
sha256sums=("8f5d221ec5e1b45ea6915dea40a72ff22eafc404f63832112a8c8bfe8106de46")

build() {
	cd "$srcdir/$pkgname-$_commit-$_commit"
	make
}

package() {
	cd "$srcdir/$pkgname-$_commit-$_commit"
	make install DESTDIR="$pkgdir" prefix="/usr"
}
