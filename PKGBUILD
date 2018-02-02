# Maintainer: Seppia <seppia@seppio.fish>
pkgname=otbluh
pkgver=0.1
pkgrel=1
pkgdesc="Simple one time pad implementation with key generating support called onetimebluh due to its features"
arch=('i686' 'x86_64' 'aarch64')
url="https://git.eigenlab.org/seppia/onetimebluh"
license=('GPLv3')
groups=()
depends=('openssl')
provides=("${pkgname}")
conflicts=("${pkgname}","${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("https://git.eigenlab.org/seppia/onetimebluh/repository/v${pkgver}/archive.tar.gz")
noextract=('archive.tar.gz')
sha256sums=('ebe244ec51b96df2b61ba7594819103dfce44f0171f87f8620b3dec92c06b265')

prepare() {
	mkdir "${srcdir}/${pkgname}"
	tar xf archive.tar.gz -C "${srcdir}/${pkgname}" --strip-components=1
}

build() {
	cd "$srcdir/${pkgname}"
	make all
}

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir/" install
}
