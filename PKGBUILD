# Maintainer: Carlo Teubner <carlo@cteubner.net>
pkgname=runapp
pkgver=0.4.0
pkgrel=1
pkgdesc="Application runner for Linux desktop environments that integrate with systemd"
arch=('x86_64')
depends=('systemd-libs')
url="https://github.com/c4rlo/runapp"
license=('MIT')
source=("https://github.com/c4rlo/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d8d6b156cae6f795bcc689b22af37a289e8f2a8b2c77c34ff37872b9294fc2cf')

build() {
  cd "$pkgname-$pkgver"
  make release
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" prefix=/usr install_runner= install
}

# vim:set ts=2 sw=2 et:
