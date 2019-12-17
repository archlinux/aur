# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>

pkgname=javacpc
pkgver=2.9.8b
pkgrel=1
epoch=1
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
sha256sums=('4d8097f5c49a5e66bee2c233d91cba1eb362a713187caca1b08d33a960a22989'
            'ad13382d3394c6e2f6718e4949718288e07f3ce2da32223b424a9c8586687357'
            '813741da2e0dab0dee069c91fedcce3fc6434e652606c2074cd5f8a171d8ce57'
            'a843c0c69d7142d72002dd5e7e94fa2e451f5218dc7f3d461edce2c47775f0f3')

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

