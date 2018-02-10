# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>

pkgname=javacpc
pkgver=2.9.6
pkgrel=2
pkgdesc="An Amstrad CPC emulator in Java, based on JEMU"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/javacpc/"
license=('unknown')
depends=('java-runtime')
install=$pkgname.install
source=("https://github.com/mdoege/javacpc-backup/blob/master/JavaCPC_Desktop_2.9.5e.zip?raw=true"
        "javacpc"
        "javacpc.desktop"
        "javacpc_icon.png")
md5sums=('feec9d81e0a286b7fbc10acf41229637'
         '1730471294aa32472586a13331547ad0'
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
