# Maintainer: alexandru.ianu@gmail.com

pkgname=open-fuse-iso
pkgver=1.1
pkgrel=1
pkgdesc="Rapid image mounting/unmounting in userspace using fuseiso."
arch=('any')
url="http://forum.manjaro.org/index.php?topic=9306.0"
license=('GPL')
depends=('fuseiso'
         'libnotify')
makedepends=('binutils')
#optdepends=('')
conflicts=('open-fuse-iso-term')
provides=('open-fuse-iso-term')
#replaces=('')
source=("$pkgname::git+https://github.com/alexandruianu/$pkgname")
install="${pkgname}.install"
md5sums=('SKIP')

package() {
  cd $srcdir/$pkgname
  mkdir -p "$pkgdir/usr/bin/"
  cp ofi "$pkgdir/usr/bin/ofi"
  cp ofit "$pkgdir/usr/bin/ofit"
  cp open-fuse-iso "$pkgdir/usr/bin/open-fuse-iso"
  chmod +x "$pkgdir/usr/bin/ofi"
  chmod +x "$pkgdir/usr/bin/ofit"
  chmod +x "$pkgdir/usr/bin/open-fuse-iso"
  mkdir -p "$pkgdir/usr/share/applications"
  cp open-fuse-iso.desktop "$pkgdir/usr/share/applications/open-fuse-iso.desktop"
  chmod +x "$pkgdir/usr/share/applications/open-fuse-iso.desktop"
  mkdir -p "$pkgdir/usr/share/man/man1"
  cp man1/open-fuse-iso.1 "$pkgdir/usr/share/man/man1/open-fuse-iso.1"
  gzip "$pkgdir/usr/share/man/man1/open-fuse-iso.1"  
}
