# Maintainer: OS Hazard <oshazard+aur@gmail.com>

pkgname=clanlib-gl1
pkgver=2.3.7
pkgrel=7
pkgdesc="Clanlib GL1 library .so from Fedora"
arch=('i686' 'x86_64')
url="http://clanlib.org/"
license=('zlib')
depends=('clanlib>=2.3.0')
makedepends=('rpmextract')
_rpmrel=7
_fc=fc23
_arch=$(uname -m)
source_i686=(ftp://ftp.is.co.za/mirror/fedora.redhat.com/linux/development/rawhide/i386/os/Packages/c/ClanLib-$pkgver-$_rpmrel.$_fc.i686.rpm)
md5sums_i686=('c6387e36973096c5dd987a6fbaee7a73')
source_x86_64=(ftp://ftp.is.co.za/mirror/fedora.redhat.com/linux/development/rawhide/x86_64/os/Packages/c/ClanLib-$pkgver-$_rpmrel.$_fc.x86_64.rpm)
md5sums_x86_64=('dcc8c1083f1553888c270785f3b8c5c0')

package () {
  cd $srcdir

  if [ ${_arch} = "i686" ]; then 
    mkdir -p $pkgdir/usr/lib
    cp usr/lib/libclan23GL1-2.3.so.1.0.0 ${pkgdir}/usr/lib/libclan23GL1-2.3.so.1.0.0
	cd ${pkgdir}/usr/lib/
	ln -s libclan23GL1-2.3.so.1.0.0 libclan23GL1-2.3.so.1
  elif [ ${_arch} = "x86_64" ]; then
    mkdir -p $pkgdir/usr/lib64
    cp usr/lib64/libclan23GL1-2.3.so.1.0.0 ${pkgdir}/usr/lib64/libclan23GL1-2.3.so.1.0.0
	cd ${pkgdir}/usr/lib64/
	ln -s libclan23GL1-2.3.so.1.0.0 libclan23GL1-2.3.so.1
  fi
}

