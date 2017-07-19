# Maintainer: Peter Mayr <petermayr@ymail.com>

pkgname=lunzip
pkgver=1.9
pkgrel=1
pkgdesc='For extracting and viewing files in .lzip archives'
url='http://www.nongnu.org/lzip/lunzip.html'
arch=('i686' 'x86_64')
license=('custom')
depends=('bzip2' 'bash')
source=("http://download.savannah.gnu.org/releases/lzip/lunzip/${pkgname}-${pkgver}.tar.gz")
sha1sums=('cc24cbd3ea3bfdc443e6e37442a0ad47b35db0d6')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
}

