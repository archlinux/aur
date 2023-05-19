# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Cesar Lucas <jester2@gmail.com>
pkgname=cdf-nasa
pkgver=3.9.0
pkgrel=1
epoch=
pkgdesc="NASA Common Data Format (CDF) library for scientific data management"
arch=("x86_64")
url="https://cdf.gsfc.nasa.gov/"
license=('unknown')
groups=()
depends=('bash')
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
source=("https://spdf.gsfc.nasa.gov/pub/software/cdf/dist/latest/linux/cdf39_0-dist-all.tar.gz")
noextract=()
md5sums=('74543ee4791bc614dd5dce126df64eec')
validpgpkeys=()

prepare() {
        cd cdf39_0-dist
}

build() {
	cd cdf39_0-dist 
	make OS=linux ENV=gnu SHARED=yes all
}

check() {
	cd cdf39_0-dist 
	make test
}

package() {
	cd cdf39_0-dist
	make INSTALLDIR="$pkgdir/usr" install
}
