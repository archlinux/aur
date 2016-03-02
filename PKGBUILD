# Maintainer: koneu <koneu93 AT googlemail DOT com>

pkgname=skype-secure
pkgver=2
pkgrel=2
arch=(any)
pkgdesc="works like skype-restricted, but wraps around already installed skype binary"
url="http://www.skype.com/"
license=('custom')
install=sskype.install
conflicts=('skype-restricted')

depends=(skype xorg-xhost sudo)
provides=('sskype')

source=(sskype 05sskype client.conf sskype.desktop)
md5sums=('bc1544ee88f58532df33465c8bb80050'
         'f94124126da310ba8e2a9aefb63dde90'
         '46775f06fd9d6c4ad5ff3a221d4912ff'
         '413a9872da5142a2bdb68b8330b512dc')

package() {
  install -D "$startdir/sskype" "$pkgdir/usr/bin/sskype"

  install -dm 750 "$pkgdir/etc/sudoers.d"
  install -m 440 "$startdir/05sskype" "$pkgdir/etc/sudoers.d/05sskype"
  
  install -Dm 644 "$startdir/client.conf" "$pkgdir/etc/default/sskype/.pulse/client.conf"

  install -Dm 644 "$startdir/sskype.desktop" "$pkgdir/usr/share/applications/sskype.desktop"
}
