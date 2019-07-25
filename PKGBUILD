# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname="unix2dos-asm"
_progname="unix2dos"
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Yet another implementation of famous unix2dos tool."
arch=("x86_64")
url="https://gitlab.com/oktopod11/unix2dos"
license=("GPL3")
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("unix2dos")
conflicts=()
replaces=()
backup=()
options=()
source=("https://gitlab.com/oktopod11/$_progname/raw/master/archive/$_progname-$pkgver.tar.gz")
noextract=()
sha256sums=("91a67c99aceaf6b4ed75495c8cab3d009d362fb69e349ebf48c1520ee828cc5e")

build() {
	cd "$srcdir/$_progname"
	make build DEBUG=
	make link
}

package() {
	cd "$srcdir/$_progname"
	mkdir -vp "$pkgdir/usr/bin/"

	make install INSTALLDIR="$pkgdir/usr/bin/"
}

