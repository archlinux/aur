# Maintainer: deddroid <deddo9412@gmail.com>
pkgname=logitech-g435-battery-bin
_name=g435-tray
pkgver=0.1.0
pkgrel=1
pkgdesc="Tray icon showing the battery level of the Logitech G435 wireless headset (prebuilt binary)"
arch=('x86_64')
url="https://github.com/deddroid/logitech-g435-battery"
license=('MIT')
depends=('gcc-libs' 'glibc' 'systemd-libs')
provides=('logitech-g435-battery' 'g435-tray')
conflicts=('logitech-g435-battery' 'g435-tray')
source=("$url/releases/download/v$pkgver/$_name-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('4cd232166b6364b1c0c06ff2caaca3cac65f9026275078bd15ead0ed51f4a000')

package() {
  cd "$_name-v$pkgver-x86_64-linux"
  install -Dm755 g435-tray "$pkgdir/usr/bin/g435-tray"
  install -Dm644 70-logitech-g435.rules "$pkgdir/usr/lib/udev/rules.d/70-logitech-g435.rules"
  install -Dm644 g435-tray.desktop "$pkgdir/usr/share/applications/g435-tray.desktop"
  install -Dm644 LICENSE THIRD-PARTY-NOTICES -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md README.it.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
