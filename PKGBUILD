pkgname=checkersland
pkgver=20190607
pkgrel=1
pkgdesc='Сheckers program for playing with computer or people via the Internet'
arch=(x86_64)
url="http://checkersland.com/"
license=('freeware')
depends=(java-runtime)
makedepends=(gendesk)
source=(http://checkersland.com/download/checkersland.jar
        checkersland
        checkersland.png)
install=checkersland.install
md5sums=('312ef7e667519732dcca5163cf308766'
         '2c37881e0f34ed66bb4bf862116787c6'
         '904461219a50a4fe6631dfe55731c2d9')

prepare() {
  gendesk -f -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --exec "checkersland" --categories "Games"
}

package() {
  install -Dm644 "${srcdir}/checkersland.jar" "${pkgdir}/usr/share/games/checkersland/checkersland.jar"
  install -Dm755 "${srcdir}/checkersland" "${pkgdir}/usr/bin/checkersland"
  install -Dm644 "${srcdir}/checkersland.desktop" "$pkgdir/usr/share/applications/checkersland.desktop"
  install -Dm644 "${srcdir}/checkersland.png" "$pkgdir/usr/share/pixmaps/checkersland.png"
  chgrp -R games "${pkgdir}/usr/share/games/checkersland"
  chmod 775 "${pkgdir}/usr/share/games/checkersland"
}
