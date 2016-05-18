# Maintainer:  graypawn <choi.pawn @gmail.com>

pkgname=yusuke
pkgver=1.7.7
pkgrel=1
pkgdesc="pacman update notifier"

arch=('i686' 'x86_64')
url="https://github.com/graypawn/yusuke"
license=('GPL3')

conflicts=('yusuke')
depends=('pacman' 'libnotify' 'python-gobject')
source=("https://github.com/graypawn/yusuke/archive/v$pkgver.zip")
md5sums=('38caecff3825c35962971aeae1335e6c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 yusuke@.service "$pkgdir/etc/systemd/system/yusuke@.service"
  install -Dm644 yusuke@.timer "$pkgdir/etc/systemd/system/yusuke@.timer"
}
