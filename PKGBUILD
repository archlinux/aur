# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmcpumon
pkgver=1.02
_pkgver=2011-05-02-14
pkgrel=2
pkgdesc="A windowmaker dockapp which shows the usage of each cpu in the system"
arch=('i686' 'x86_64')
url="http://dockapps.windowmaker.org/file.php/id/360"
license=('AGPL3')
groups=('x11')
depends=('libxext' 'libxcb' 'xcb-util' 'xcb-util-wm' 'xcb-util-image')
source=("http://dockapps.windowmaker.org/download.php/id/872/$pkgname-$_pkgver.tar.bz2")
md5sums=('368ebfb30be65ac2a0c107111ad8df86')
 
build() {
  cd "$srcdir/$pkgname"
  make 
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 $pkgname.1 $pkgdir/usr/share/man/man1/$pkgname.1
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
}

