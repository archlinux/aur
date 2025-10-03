# Maintainer: Carlo Teubner <carlo@cteubner.net>
pkgname=runapp
pkgver=0.4.1
pkgrel=1
pkgdesc="Application runner for Linux desktop environments that integrate with systemd"
arch=('x86_64')
depends=('systemd-libs')
url="https://github.com/c4rlo/runapp"
license=('MIT')
source=("https://github.com/c4rlo/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('e9ab8627f6bb33ccfdfae8baf90ab8e947d6134f71c4514a1d10925b67c78a0a')

build() {
  cd "$pkgname-$pkgver"
  make release
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" prefix=/usr install_runner= install
}

# vim:set ts=2 sw=2 et:
