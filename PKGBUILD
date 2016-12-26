# Maintainer: Peter Mayr <petermayr@ymail.com>

pkgname=lunzip
pkgver=1.8
pkgrel=0
pkgdesc='For extracting and viewing files in .lzip archives'
url='http://www.nongnu.org/lzip/lunzip.html'
arch=('i686' 'x86_64')
license=('custom')
depends=('bzip2' 'bash')
source=("http://download.savannah.gnu.org/releases/lzip/lunzip/${pkgname}-${pkgver}.tar.gz")
sha1sums=('274d12503a4e4e1a92b8dd68e15bd6e8f63e4da7')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
}

