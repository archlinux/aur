# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname=marg
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Simple argument handling library for C programs"
arch=("any")
url="https://gitlab.com/oktopod11/marg"
license=("LGPL3")
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("marg")
conflicts=()
replaces=()
backup=()
options=()
source=("https://gitlab.com/oktopod11/$pkgname/raw/master/archive/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=("be0ee8c6727745bc7b842c30fbdfdb277da5d05b0df4d5432721e560685370e4")

prepare() {
	tar -xvf "$pkgname-$pkgver.tar.gz"
}

package() {
	mkdir -vp "$pkgdir/usr/include/"
	mkdir -vp "$pkgdir/usr/share/man/man3/"
	cp -rv "$srcdir/$pkgname/lib/" "$pkgdir/usr/include/marg/"
	cp -v "$srcdir/$pkgname/marg.man" "$pkgdir/usr/share/man/man3/marg.3"
	gzip -v "$pkgdir/usr/share/man/man3/marg.3"
}
