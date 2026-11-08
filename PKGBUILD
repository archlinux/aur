# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=sweetbg-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Small, lightweight and static Wayland wallpaper daemon"
arch=('x86_64')
url="https://github.com/sweetwm/sweetbg"
license=('GPL-3.0-or-later')
provides=('sweetbg')
conflicts=('sweetbg' 'sweetbg-git')
options=('!debug')
depends=('wayland' 'libpng' 'libjpeg-turbo' 'libwebp')
source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/sweetbg-$pkgver-x86_64-linux.tar.gz"
)
sha256sums=('8ac961b6c921b7b9e59bac01723eb97fef67c1a96c3c14e2c4d395f59ee16183')

package() {
  cd "sweetbg-$pkgver-x86_64-linux"

  install -Dm755 usr/bin/sweetbg "$pkgdir/usr/bin/sweetbg"
  install -Dm755 usr/bin/sweetbgd "$pkgdir/usr/bin/sweetbgd"

  install -Dm644 usr/lib/systemd/user/sweetbgd.service \
    "$pkgdir/usr/lib/systemd/user/sweetbgd.service"

  install -Dm644 usr/share/man/man1/sweetbg.1 \
    "$pkgdir/usr/share/man/man1/sweetbg.1"
  install -Dm644 usr/share/man/man1/sweetbgd.1 \
    "$pkgdir/usr/share/man/man1/sweetbgd.1"
  install -Dm644 usr/share/man/man5/sweetbg.5 \
    "$pkgdir/usr/share/man/man5/sweetbg.5"

  install -Dm644 README.md "$pkgdir/usr/share/doc/sweetbg/README.md"
}
