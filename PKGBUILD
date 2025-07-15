# Maintainer: willemw <willemw12@gmail.com>
# Contributor: George Angelopoulos <george@usermod.net>

pkgname=tremc
pkgver=0.9.4
pkgrel=1
pkgdesc='Curses interface for Transmission. Python 3 fork of transmission-remote-cli'
arch=(any)
url=https://github.com/tremc/tremc
license=(GPL-3.0-or-later)
depends=(python)
optdepends=(
  'python-geoip: guess which country peers come from'
  'python-geoip2: guess which country peers come from'
  'python-pyperclip: copy magnet links to the system clipboard')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f8cd45f2bfc1fa67dc8816659d81beacb9fd7b7a4a4b8402604a71c29836bd6f')

package() {
  install -Dm644 $pkgname-$pkgver/settings.cfg -t "$pkgdir/usr/share/$pkgname"
  make -C $pkgname-$pkgver PREFIX=/usr DESTDIR="$pkgdir" install
}
