# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname="nixwriter"
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Create bootable Linux images with dd and from a GTK user interface"
arch=("x86_64")
url="https://gitlab.com/9898287/nixwriter"
license=("MIT")
groups=()
depends=("gtk3" "polkit" "util-linux") 
makedepends=("ldc" "libphobos" "dub")
checkdepends=()
optdepends=("libnotify: notifications")
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("git+https://gitlab.com/9898287/nixwriter.git")
noextract=("git+https://gitlab.com/9898287/nixwriter.git")
sha256sums=("SKIP")

prepare() {
	cd "$srcdir/$pkgname"
	git reset --hard "5b1dbf37f7caffcbe9f4dd3fb7cccb2e1141b3ca"
}

build() {
	cd "$srcdir/$pkgname"
	dub build -b release -defaultlib --compiler ldc
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -vp "$pkgdir/usr/bin/"

	cp -v "bin/$pkgname" "$pkgdir/usr/bin/"
}

