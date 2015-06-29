# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=ntfsfixboot
pkgver=1.0
pkgrel=4
pkgdesc="Fix NTFS boot sector"
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/ntfsfixboot/'
license=('GPL')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('88776b669ea77f1d9ab30ae38d4480c0f929768bb3901b2e47cc9b3618b4b6cb')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}/

	# make sure it cross compiles
	sed '/gcc -Wall -o $(TARGET) \$</ s/$/ $(CFLAGS)/' -i Makefile
	make
}

package() {
	install -D -m 0755 ${srcdir}/${pkgname}-${pkgver}/ntfsfixboot ${pkgdir}/usr/bin/ntfsfixboot
}

