# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Cesar Lucas <jester2@gmail.com>
pkgname=cdf-nasa
pkgver=3.7.1
pkgrel=1
epoch=
pkgdesc="NASA Common Data Format (CDF) library for scientific data management"
arch=("x86_64")
url="https://cdf.gsfc.nasa.gov/"
license=('unknown')
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
source=("https://spdf.sci.gsfc.nasa.gov/pub/software/cdf/dist/cdf37_1/linux/cdf37_1-dist-all.tar.gz" "cdf37_1a-dist.patch")
noextract=()
md5sums=('0f434ffbb7f6ffe39b2bb20c5a940aee'
         '9fc2c368fb7d0700d28cdb9a2280891d')
validpgpkeys=()

prepare() {
        cd cdf37_1-dist
        patch --strip=1 --input=../cdf37_1a-dist.patch
}

build() {
	cd cdf37_1-dist 
	make OS=linux ENV=gnu SHARED=yes all
}

check() {
	cd cdf37_1-dist 
	make test
}

package() {
	cd cdf37_1-dist
	make INSTALLDIR="$pkgdir/usr" install
}
