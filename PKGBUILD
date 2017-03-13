# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=helloworld
pkgver=0.1
pkgrel=1
pkgdesc="A program prints 'Hello world'"
arch=(any)
license=('unknown')
depends=('glibc')
makedepends=('git')
checkdepends=('glibc')
source=("git://github.com/LuckyBC/helloworld.git")
noextract=()
sha256sums=(SKIP)
_gitname="helloworld"

build() {
	cd "$_gitname"
	./configure --prefix=/usr
	make
}

check() {
	cd "$_gitname"
	make -k check
}

package() {
	cd "$_gitname"
	make DESTDIR="$pkgdir/" install
}
