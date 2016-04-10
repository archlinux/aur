# Maintainer: Francisco Demartino <demartino.francisco@gmail.com>
pkgname=deflemask
pkgver=12
pkgrel=0
pkgdesc="A Multi-System music tracker (Genesis/MegaDrive, NES/Famicom (nsf), Commodore 64 (sid), and many others)"
arch=('i686' 'x86_64')
url='http://www.delek.com.ar/deflemask'
license=('unknown')
depends=(sdl freeglut unionfs-fuse)
# _tarfile=DefleMask_Linux.tar.gz
# _tarlink=http://www.delek.com.ar/soft/deflemask/$_tarfile
_tarfile=DefleMask_v12_Linux.tar.gz
_tarlink=http://www.delek.net/$_tarfile
source=($_tarlink
        launcher.sh)
md5sums=('3211748e968eeaa692605867f8cc1651'
         '81d19468cae85f038ad2999bebc2f026')
package() {
	install -d $pkgdir/opt/$pkgname

	# copy tarbombed src
	cp -r $srcdir/* $pkgdir/opt/$pkgname/

	# fix perms
	chmod -R 755 $pkgdir/opt/$pkgname/

	# remove pre-tarbomb files
	rm $pkgdir/opt/$pkgname/{launcher.sh,$_tarfile}

	install -D $srcdir/launcher.sh $pkgdir/usr/bin/$pkgname
}
