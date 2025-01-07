# Maintainer: Sterophonick
pkgname=devkitadv-bin
pkgbase=devkitadv
_pkgname='devkitadv'
pkgver=r4linux
pkgrel=2
pkgdesc="Jason Wilkins' Game Boy Advance SDK (GCC 3.1)"
url='https://sourceforge.net/projects/devkitadv/'
arch=(x86_64 i686)
makedepends=(p7zip)
source=(https://master.dl.sourceforge.net/project/devkitadv/Linux/Release%204/devkitadv.tar.bz2
        10-devkitadv.conf)
md5sums=('03f107b3decff9238572f90939c4b16b'
         '1994d47e35d52f8c55dee5aee78eed9e')
license=('nonfree')
options=(!debug !strip)

package() {
  cd $srcdir

  mkdir -p $pkgdir/opt/
  cp -r devkitadv $pkgdir/opt/
  chmod -R 777 $pkgdir/opt/devkitadv

  mkdir -p $pkgdir/etc/environment.d
  cp 10-devkitadv.conf $pkgdir/etc/environment.d
}
