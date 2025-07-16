# Maintainer: Carlo Teubner <carlo@cteubner.net>
pkgname=runapp
pkgver=0.3.1
pkgrel=1
pkgdesc="Application runner for Linux desktop environments that integrate with systemd"
arch=('x86_64')
depends=('systemd-libs')
url="https://github.com/c4rlo/runapp"
license=('MIT')
source=("https://github.com/c4rlo/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('194eaa8ebc854c57b474f56f0d24d38fed50a193ca369a45b240d3c85c805d30')

build() {
  cd "$pkgname-$pkgver"
  make release
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" prefix=/usr install_runner= install
}

# vim:set ts=2 sw=2 et:
