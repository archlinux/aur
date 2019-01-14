# Maintainer: Peter Mayr <petermayr@ymail.com>

pkgname=lunzip
pkgver=1.11
pkgrel=2
pkgdesc='For extracting and viewing files in .lzip archives'
url='http://www.nongnu.org/lzip/lunzip.html'
arch=('i686' 'x86_64')
license=('custom')
depends=('bzip2' 'bash')
source=("http://download.savannah.gnu.org/releases/lzip/lunzip/${pkgname}-${pkgver}.tar.gz")
sha1sums=('e6e7ab7d3594f5f5ac522541043d0f32c2eec914')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
}
