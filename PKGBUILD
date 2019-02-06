# Maintainer: Victor3D <webmaster@victor3d.com.br>
pkgname=syn68k
pkgver=1
pkgrel=1
epoch=
pkgdesc="Synthetic 68K CPU (used by Executor)"
arch=('x86_64')
url=""
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/victor3dptz/executor-packaging/raw/master/arch/syn68k.tar.gz")
noextract=()
md5sums=('20a822f86b2a841d0bb4757fa8240b95')
validpgpkeys=()

prepare() {
	cd "$pkgname"
	./autogen.sh
}

build() {
	cd "$pkgname"
	CC='gcc -m32' ./configure --build=i686-pc-linux-gnu --host=i686-pc-linux-gnu --prefix=/usr
	make
}

check() {
	cd "$pkgname"
	make -k check
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
