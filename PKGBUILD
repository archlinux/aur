# Maintainer: Sterophonick
pkgname=devkitarm-r47-bin
_pkgname='devkitarm-r47-bin'
pkgver=r47
pkgrel=1
pkgdesc="Older version of devkitARM and libgba (GCC 7.1.0). Intended for legacy GBA dev."
url='https://sourceforge.net/projects/devkitadv/'
arch=(x86_64 i686)
makedepends=(p7zip)
source=(https://wii.leseratte10.de/devkitPro/devkitARM/r47%20%282017%29/devkitARM_r47-x86_64-linux.tar.bz2
        https://wii.leseratte10.de/devkitPro/libgba/libgba_0.5.1/libgba-0.5.1.tar.bz2)
md5sums=('77212d6eaaeedefe4b40d9101b0acf7a' '1ae988c7c19b336852d0cb36c64f9f03')
license=('gplv3')
options=(!debug !strip)
noextract=('libgba-0.5.1.tar.bz2')

package() {
  cd $srcdir

  mkdir -p $pkgdir/opt/devkitpro-old/libgba
  cp -r devkitARM $pkgdir/opt/devkitpro-old

  7z x libgba-0.5.1.tar.bz2 -o$srcdir
  7z x libgba-0.5.1.tar -o$pkgdir/opt/devkitpro-old/libgba

  chmod -R 777 $pkgdir/opt/devkitpro-old
}
