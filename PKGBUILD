# Maintainer: Meow0x7E <Meow0x7E@outlook.com>
pkgname=slow-scan-print
pkgver=0.2.2
pkgrel=3
epoch=
pkgdesc="This CLI program prints text at fixed intervals by character or line, and its name was inspired by SSTV (Slow-Scan TV)."
arch=("any")
url=
license=('LGPL3')
groups=()
depends=()
makedepends=("cargo")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=("!debug")
install=
changelog=
source=()
noextract=()
sha256sums=()
validpgpkeys=()

build() {
	if [[ -d ${HOME}/.rustup ]]; then
		ln -srfv ${HOME}/.rustup ${srcdir}/.rustup
	fi
	HOME=${srcdir} cargo install --version=${pkgver} slow-scan-print
}

package() {
	mkdir -vp ${pkgdir}/usr/bin
	cp -vu ${srcdir}/.cargo/bin/slow-scan-print ${pkgdir}/usr/bin
}

# vim:set sts=4 ts=4 sw=4 noexpandtab:
