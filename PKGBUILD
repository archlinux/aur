# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname=wallo
pkgver=0.6
pkgrel=1
epoch=
pkgdesc="Wallpaper organizer"
arch=("any")
url="https://gitlab.com/oktopod11/wallo"
license=("GPL")
groups=()
depends=("bash" "file" "coreutils" "gawk" "sed" "imagemagick")
makedepends=()
checkdepends=()
optdepends=()
provides=("wallo")
conflicts=()
replaces=()
backup=()
options=()
source=("https://gitlab.com/oktopod11/$pkgname/raw/master/archive/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=("1084671ea3a1243a14e7132755b6627784a4040b86923e60dfe4d7ee28567d67")

prepare() {
	tar -xvf "$pkgname-$pkgver.tar.gz"
}

package() {
	mkdir -vp "$pkgdir/usr/bin/"
	mkdir -vp "$pkgdir/usr/share/man/man1/"
	cp -v "$pkgname-$pkgver/wallo.sh" "$pkgdir/usr/bin/wallo"
	cp -v "$pkgname-$pkgver/wallo.man" "$pkgdir/usr/share/man/man1/wallo.1"
	gzip -v "$pkgdir/usr/share/man/man1/wallo.1"
}
