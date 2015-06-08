# Contributor: Christian Passet <c.passet@gmx.at>
pkgname=pthsem
pkgver=2.0.8
pkgrel=4
pkgdesc="Extend version of pth with support for semaphores added." 
arch=('i686' 'x86_64' 'arm' 'arm7vh')
url="http://www.auto.tuwien.ac.at/~mkoegler/index.php/pth"
license=('GPL')
source=(http://www.auto.tuwien.ac.at/~mkoegler/pth/${pkgname}_${pkgver}.tar.gz)
md5sums=('9144b26dcc27e67498d63dd5456f934c')
#build() {
#         cd ${startdir}/src/${pkgname}-${pkgver}
#            ./configure --prefix=/usr
#              make || return 1
#                make prefix=$startdir/pkg/usr install
#        }
build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
