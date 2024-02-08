# Maintainer: tijko <konick781@gmail.com> 

pkgname=emptty-bin

pkgver=0.11.0
pkgrel=1
pkgdesc="Dead simple CLI Display Manager on TTY"
arch=('x86_64')
url="https://github.com/tvrzna/emptty"
license=('MIT')
depends=('pam' 'libx11')
makedepends=('go' 'git')
optdepends=('xorg-server: default display server'
            'xorg-xauth: required if using xorg-server'
            'util-linux: mcookie required if using xorg-server'
            'wayland: alternative to xorg-server')
backup=('etc/emptty/conf')
provides=('emptty')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$arch-$pkgver.tar.gz")
sha512sums=('9e32957a8c120cd01bdd9deb200325b5da89ac7dbfb4835e49a7c86e8e40d952d4d013af48bc50dbdb0af3bbf753061225611336994a1e134ca88915349171df')

package() {
  install -DZs "usr/bin/emptty" -m 755 -t "/usr/bin"
  install -DZ "etc/emptty/conf" -m 644 -T "/etc/emptty/conf"
  install -D "usr/share/man/man1/emptty.1.gz" -t "/usr/share/man/man1"
  install -DZ "usr/lib/systemd/system/emptty.service" -m 644 -T "/usr/lib/systemd/system/emptty.service"
  install -Dm 644 usr/share/licenses/LICENSE -t /usr/share/licenses/$pkgname/LICENSE
}