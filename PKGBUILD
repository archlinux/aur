# Maintainer: Mustafa Kuscu <mustafakuscu@gmail.com>
pkgname=man-pages-tr
pkgver=1.0.5
pkgrel=2
pkgdesc='A collection of Turkish translations of Linux manual pages'
arch=('any')
license=('GPL')
url='http://sourceforge.net/projects/belgeler/'
depends=('man-db')
makedepends=('sed')
source=(http://downloads.sourceforge.net/project/belgeler/man-pages-tr/man-pages-tr-1.0.5/man-pages-tr-1.0.5.tar.gz)
md5sums=('8f322a60c80e31c34ef8979edaf68aae')

prepare() {
# remove the following from source, as they already exist in the root file system
rm man-pages-tr-1.0.5/source/man1/{apropos,man,chage,passwd}.1.xml
rm man-pages-tr-1.0.5/source/man5/{passwd,shadow}.5.xml
rm man-pages-tr-1.0.5/source/man8/{groupadd,groupdel,groupmod,useradd,userdel,usermod}.8.xml
}

package() {
	cd $srcdir/man-pages-tr-1.0.5

	make DESTDIR=$pkgdir utf8 
	make DESTDIR=$pkgdir deb-install 
}

