# Maintainer: tijko <konick781@gmail.com> 

pkgname=emptty-bin

pkgver=0.11.0
pkgrel=1
pkgdesc="Dead simple CLI Display Manager on TTY"
arch=('x86_64')
url="https://github.com/tijko/emptty-bin"
license=('MIT')
depends=('pam' 'libx11')
makedepends=('go' 'git')
optdepends=('xorg-server: default display server'
            'xorg-xauth: required if using xorg-server'
            'util-linux: mcookie required if using xorg-server'
            'wayland: alternative to xorg-server')
backup=('etc/emptty/conf')
provides=('emptty')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('764600225896bd4b47b5fee312ee102ad87e4a337e68d17240f32f2d9ae9f06200e1927b6402a5a682f9b9101bd0383e62ceb0094bf9f4a8a21868496cb9289f')

package() {
  install -DZs "usr/bin/emptty" -m 755 -t "/usr/bin"
  install -DZ "etc/emptty/conf" -m 644 -T "/etc/emptty/conf"
  install -D "usr/share/man/man1/emptty.1.gz" -t "/usr/share/man/man1"
  install -DZ "usr/lib/systemd/system/emptty.service" -m 644 -T "/usr/lib/systemd/system/emptty.service"
  install -Dm 644 usr/share/licenses/LICENSE -t /usr/share/licenses/$pkgname/LICENSE
}