# Maintainer: Peter <peter@nexoid.at>
pkgname=picrin-scheme-git
pkgver=0.4.r0.g7b725f45
pkgrel=1
epoch=
pkgdesc="Picrin is a lightweight R7RS scheme implementation written in pure C89."
arch=(x86_64 i686)
url="https://github.com/picrin-scheme/picrin"
license=('mit')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source=("git+https://github.com/picrin-scheme/picrin.git")
md5sums=('SKIP')
noextract=()
validpgpkeys=()

pkgver() {
  cd "picrin"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "picrin"
	make
}

package() {
	cd "picrin"
        mkdir -p ${pkgdir}/usr/bin
        install ${srcdir}/picrin/picrin ${pkgdir}/usr/bin/
}
