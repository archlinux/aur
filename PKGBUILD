# Maintainer: Seppia <seppia@seppio.fish>
pkgname=otbluh
pkglongname=onetimebluh
pkgver=0.2
pkgrel=1
pkgdesc="Simple one time pad implementation with key generating support called onetimebluh due to its features"
arch=('i686' 'x86_64' 'aarch64')
url="https://git.eigenlab.org/seppia/onetimebluh"
license=('GPLv3')
groups=()
depends=('openssl')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
source=("https://git.seppia.net/onetimebluh.git/snapshot/${pkglongname}-${pkgver}.tar.gz")
sha256sums=('479bbeb9f860d50aabe6db561965b231fec496478baa81a1f08128d7743783ad')

build() {
	cd "$srcdir/${pkglongname}-${pkgver}"
	make all
}

package() {
	cd "$srcdir/${pkglongname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
