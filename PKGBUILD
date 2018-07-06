# Maintainer: Seppia <seppia@seppio.fish>
pkgname=otbluh
pkglongname=onetimebluh
pkgver=0.3
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
sha256sums=('fc0c426e87f7b76c44efe720ef778bfbfed3fa81c711bb245cf6ca28ab816a99')

build() {
	cd "$srcdir/${pkglongname}-${pkgver}"
	make all
}

package() {
	cd "$srcdir/${pkglongname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
