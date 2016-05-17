# Maintainer:  graypawn <choi.pawn @gmail.com>
pkgname=yusuke
_gitname=yusuke
pkgver=1.7.6
pkgrel=2
pkgdesc="pacman update notifier"

arch=('i686' 'x86_64')
url="https://github.com/graypawn/yusuke"
license=('GPL3')

conflicts=('yusuke')
depends=('pacman' 'libnotify' 'python-gobject')
source=("https://github.com/graypawn/yusuke/archive/v$pkgver.zip")
md5sums=('c642ace6ecc0c28a8be62d899a9cf48a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 yusuke "$pkgdir/usr/bin/yusuke"
  install -Dm644 yusuke@.service "$pkgdir/etc/systemd/system/yusuke@.service"
  install -Dm644 yusuke@.timer "$pkgdir/etc/systemd/system/yusuke@.timer"
}
