# Maintainer: Seppia <seppia@seppio.fish>
pkgname=otbluh
pkglongname=onetimebluh
pkgver=0.1
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
sha256sums=('efde76c8832d8f9bdd514cd4906424f86cf40f9d183e2b047c64a05a3ee88728')

build() {
	cd "$srcdir/${pkglongname}-${pkgver}"
	make all
}

package() {
	cd "$srcdir/${pkglongname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
