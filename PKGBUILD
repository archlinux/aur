# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=tty-no-cursor-blink
pkgver=0.1.0
pkgrel=1
pkgdesc="Disable blinking cursor in Linux tty"
arch=('any')
depends=('systemd')
url="https://github.com/atweiden/tty-no-cursor-blink"
license=('UNLICENSE')
source=(https://github.com/atweiden/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('f591a917d72c7da1b6f494e122a64e96fdfb2a6eaf3e76a9f4e2a80c24fc3a9d')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -Dm 644 systemd/tty-no-cursor-blink.conf -t "$pkgdir/etc/tmpfiles.d"
}
