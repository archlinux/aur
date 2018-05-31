# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>

pkgname=javacpc
pkgver=2.9.6d
pkgrel=1
pkgdesc="An Amstrad CPC emulator in Java, based on JEMU"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/javacpc/"
license=('unknown')
depends=('java-runtime')
install=$pkgname.install
source=("http://downloads.sourceforge.net/project/javacpc/JavaCPC%20Desktop/JavaCPC_Desktop_"$pkgver".zip"
        "javacpc"
        "javacpc.desktop"
        "javacpc_icon.png")
md5sums=('b29440df968b30108010aa7d959fa3b9'
         '33ea1029c38c0db8d8a6a83da52f6abe'
         'ad11d7aba73f349177d8cc2014b9b874'
         'e7711486f5ab6a9c907745f47eef853d')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/javacpc
  cp -pr * $pkgdir/usr/lib/javacpc
  cd $pkgdir/usr/lib/javacpc/
  rm -fr *.exe *.dll lib/sunos lib/windows
  install -Dm 755 javacpc $pkgdir/usr/bin/javacpc
  install -D javacpc_icon.png $pkgdir/usr/share/icons/javacpc_icon.png
  install -D javacpc.desktop $pkgdir/usr/share/applications/javacpc.desktop
}
