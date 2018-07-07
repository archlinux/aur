# Maintainer: Seppia <seppia@seppio.fish>
pkgname=otbluh
pkglongname=onetimebluh
pkgver=0.3.1
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
sha256sums=('19f0696bcc2bfa252d1d138ad73ef443203174acd0f2541b73b90fdbc79109e0')

build() {
	cd "$srcdir/${pkglongname}-${pkgver}"
	make all
}

package() {
	cd "$srcdir/${pkglongname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
