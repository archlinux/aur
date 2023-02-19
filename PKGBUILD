# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=commifs
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="This is filesystem that uses a lot of memory"
arch=(x86_64 i686)
url="https://gitlab.com/lgrobelczyk/commifs.git"
license=('MIT')
groups=()
depends=('fuse2' 'glibc')
makedepends=(
	git
	gcc
)
checkdepends=()
optdepends=()
provides=(commifs)
conflicts=($pkgname)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd commifs
	make
}

package() {
	cd commifs
	mkdir -p ${pkgdir}/opt/commifs
	cp -rf * ${pkgdir}/opt/commifs
}
