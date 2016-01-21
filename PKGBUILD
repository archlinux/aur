# Maintainer: Antoine Pierlot-Garcin <antoine.pierlot-garcin@scle.fr>
pkgname=libxmltok
pkgver=1.2
pkgrel=1
epoch=
pkgdesc="XML Parser Toolkit"
arch=('x86_64' 'i686' 'arm')
url="https://packages.debian.org/en/source/stretch/libxmltok"
license=('custom')
groups=()
depends=('glibc')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('libwww')
replaces=()
backup=()
options=()
install=
changelog=
source=("http://http.debian.net/debian/pool/main/libx/libxmltok/${pkgname}_${pkgver}.orig.tar.gz"
        "debian-libxmltok.patch")
noextract=()
md5sums=('9e3ecda3493f73fbc6632a00f8e42724'
         '80fca8667b9d6038403549c37ef04094')
validpgpkeys=()

prepare() {
	cd "expat-$pkgver"
	patch -p1 -i "$srcdir/debian-libxmltok.patch"
}

build() {
	cd "expat-$pkgver"
	make
}

package() {
	cd "expat-$pkgver"
	make prefix="$pkgdir/usr" install
	rm -rf "$pkgdir/usr/bin"
}
