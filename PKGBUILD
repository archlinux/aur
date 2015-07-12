# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>

pkgname=javacpc
pkgver=2.9m
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
md5sums=('9a859a27d635f57f560d86f1c5dbe7bf'
         '1730471294aa32472586a13331547ad0'
         'ad11d7aba73f349177d8cc2014b9b874'
         '9a3484df10f16187980721111a264655')

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
