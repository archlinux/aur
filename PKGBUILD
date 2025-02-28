# Maintainer: René Wagner < rwa at clttr dot info >

pkgname=phosta
pkgver=1.3.5
pkgrel=1
pkgdesc='photo stats for your terminal'
arch=('x86_64' 'i686' 'aarch64')
depends=('perl-image-exiftool' 'sqlite3' 'perl-text-simpletable-autowidth' 'perl-file-homedir' 'perl-dbd-sqlite' 'perl-switch')
makedepends=('scdoc')
license=('BSD-3-Clause')
url='https://sr.ht/~rwa/photo-apps'
options=(!strip)
source=("git+https://git.sr.ht/~rwa/photo-stats#tag=${pkgver}") 
sha256sums=('SKIP')

build() {
	cd "${srcdir}/photo-stats"
	make
}

package() {
	cd "${srcdir}/photo-stats"
	make install DESTDIR="${pkgdir}" PREFIX="/usr"
}
