# Maintainer: OS Hazard <oshazard+aur@gmail.com>

pkgname=clanlib-gl1
pkgver=2.3.7
pkgrel=9
pkgdesc="Clanlib GL1 library .so from Fedora"
arch=('i686' 'x86_64')
url="http://clanlib.org/"
license=('zlib')
depends=('clanlib>=2.3.0')
makedepends=('rpmextract')
_rpmrel=9
_fc=fc24
_arch=$(uname -m)
source_i686=("http://mirrors.tummy.com/pub/fedora.redhat.com/fedora/linux/development/rawhide/Everything/i386/os/Packages/c/ClanLib-$pkgver-$_rpmrel.$_fc.i686.rpm")
md5sums_i686=('73cedd234055ca5c2eb0fbb6c44ad18f')
md5sums_x86_64=('a1963384e2a4ac8ac114dc4369e7d42e')
source_x86_64=("http://mirrors.tummy.com/pub/fedora.redhat.com/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/c/ClanLib-$pkgver-$_rpmrel.$_fc.x86_64.rpm")

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

