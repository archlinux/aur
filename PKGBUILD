# Maintainer: Francisco Demartino <demartino.francisco@gmail.com>
pkgname=deflemask
pkgrel=1
pkgdesc="A Multi-System music tracker (Genesis/MegaDrive, NES/Famicom (nsf), Commodore 64 (sid), and many others)"
arch=('i686' 'x86_64')
url='http://www.delek.com.ar/deflemask'
license=('unknown')
depends=(sdl freeglut unionfs-fuse)
_tarfile=DefleMask_Linux.tar.gz
_tarlink=http://www.delek.com.ar/soft/deflemask/$_tarfile
source=($_tarlink
        launcher.sh)
pkgver=10
md5sums=('51d1f229c3549f8dc086fffbc692a884'
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
