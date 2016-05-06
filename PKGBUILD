# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Peter <craven@gmx.net>
pkgname=mosh-scheme
pkgver=0.2.7
pkgrel=1
epoch=
pkgdesc="Mosh is a free and fast interpreter for Scheme as specified in the R6RS."
arch=(x86_64 i686)
url=""
license=('unknown')
groups=()
depends=(oniguruma)
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
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/$pkgname/mosh-$pkgver.tar.gz")
md5sums=('268598897536ff352296a905879940ad')
noextract=()
validpgpkeys=()

build() {
	cd "mosh-$pkgver"
	./configure --prefix=/usr --program-suffix=-scheme
	make
}

# check() {
# 	cd "mosh-$pkgver"
# 	make -k check
# }

package() {
	cd "mosh-$pkgver"
	make DESTDIR="$pkgdir/" install
}
