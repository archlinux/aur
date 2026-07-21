# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=sound-switcher-gtk
pkgver=0.1.0
pkgrel=1
pkgdesc="GTK4 audio device picker with Bluetooth reconnection"
arch=('any')
url="https://github.com/chmouel/sound-switcher-gtk"
license=('GPL-3.0-only')
depends=('bluez-utils' 'gtk4' 'libpulse' 'python' 'python-gobject')
optdepends=('fzf: terminal device picker'
            'libnotify: desktop notifications')
provides=('sound-switcher')
conflicts=('sound-switcher')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('73bed6ad13e3ff508f1647559675080f07d4b243fb3fc481e363a1375052a038')

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
