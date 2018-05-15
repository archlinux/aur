# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

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
source=("http://victor3d.karelia.pro/arch/syn68k.tar.gz")
noextract=()
md5sums=('20a822f86b2a841d0bb4757fa8240b95')
validpgpkeys=()

prepare() {
	cd "$pkgname"
	./autogen.sh
}

build() {
	cd "$pkgname"
	./configure --prefix=/usr
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
