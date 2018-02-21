# Maintainer: Jonatan Bravo <zephrax@gmail.com>
pkgname=universal-ctags
pkgver=git
pkgrel=1
epoch=
pkgdesc=" A maintained ctags implementation"
arch=("x86_64")
url="https://ctags.io"
license=('GPL-2.0')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("ctags", "readtags")
source=("git://github.com/universal-ctags/ctags.git")
sha256sums=("SKIP")
validpgpkeys=()

package() {
	cd "${srcdir}/ctags-master"
	./autogen.sh
	./configure
	make
	mkdir -p "${pkgdir}/usr/local/bin"
	mkdir -p "${pkgdir}/usr/local/share/man/man1"
	mkdir -p "${pkgdir}/usr/local/share/man/man7"
	install -m755 -c ctags readtags "${pkgdir}/usr/local/bin/"
	install -m644 -c man/ctags-incompatibilities.7 man/ctags-optlib.7 "${pkgdir}/usr/local/share/man/man7"
	install -m644 -c man/ctags.1 "${pkgdir}/usr/local/share/man/man1"
}
