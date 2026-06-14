pkgname=8bitdo-pro2-a-mode-hid-daemon
pkgver=0.1.1
pkgrel=2
pkgdesc='8BitDo Pro 2 A-mode Bluetooth HID to uinput daemon'
arch=('any')
url='https://github.com/sidevesh/8bitdo-pro2-a-mode-hid-daemon'
license=('MIT')
depends=('python' 'systemd')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=(
  "$pkgname-$pkgver::git+https://github.com/sidevesh/8bitdo-pro2-a-mode-hid-daemon.git#tag=$pkgver"
)
sha256sums=('SKIP')
install=8bitdo-pro2-a-mode-hid-daemon.install

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/8bitdo-pro2-a-mode-hid-daemon.py" "$pkgdir/usr/bin/8bitdo-pro2-a-mode-hid-daemon"
  install -Dm644 "$srcdir/$pkgname-$pkgver/8bitdo-pro2-a-mode-hid-daemon.service" "$pkgdir/usr/lib/systemd/system/8bitdo-pro2-a-mode-hid-daemon.service"
}
