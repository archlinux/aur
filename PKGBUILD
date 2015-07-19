# Maintainer: alexandru.ianu@gmail.com

pkgname=open-fuse-iso-term
_pkgname=open-fuse-iso
pkgver=1.1
pkgrel=1
pkgdesc="Rapid image mounting/unmounting in userspace using fuseiso. Terminal/CLI only version."
arch=('any')
url="http://forum.manjaro.org/index.php?topic=9306.0"
license=('GPL')
depends=('fuseiso')
makedepends=('binutils')
#optdepends=('')
conflicts=('open-fuse-iso')
#provides=('')
#replaces=('')
source=("${_pkgname}::git+https://github.com/alexandruianu/${_pkgname}")
md5sums=('SKIP')

package() {
  cd $srcdir/${_pkgname}
  mkdir -p "$pkgdir/usr/bin/"
  cp ofit "$pkgdir/usr/bin/ofit"
  chmod +x "$pkgdir/usr/bin/ofit"
  mkdir -p "$pkgdir/usr/share/man/man1"
  cp man1/open-fuse-iso.1 "$pkgdir/usr/share/man/man1/open-fuse-iso.1"
  gzip "$pkgdir/usr/share/man/man1/open-fuse-iso.1"  
}
