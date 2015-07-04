
pkgname=gimp-plugin-refocusit
pkgdesc="Iterative refocus plug-in for GIMP"
arch=('i686' 'x86_64')

pkgver=2.0.0
pkgrel=1

url="http://refocus-it.sourceforge.net/"
license="GPL"

depends=('gimp' 'perl-xml-parser')
conflicts=('gimp-plugin-exif-browser')

source=("http://netcologne.dl.sourceforge.net/project/refocus-it/refocus-it/${pkgver}/refocus-it-${pkgver}.tar.gz")
md5sums=('7a874598e48029e754c631c899055788')


package() {
  	cd ${srcdir}/refocus-it-${pkgver}
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=${pkgdir} install
}
