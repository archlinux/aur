# Maintainer: willemw <willemw12@gmail.com>
# Contributor: George Angelopoulos <george@usermod.net>

pkgname=tremc
pkgver=0.9.5
pkgrel=1
pkgdesc='Curses interface client for Transmission'
arch=(any)
url=https://github.com/tremc/tremc
license=(GPL-3.0-or-later)
depends=(python)
optdepends=(
  'python-geoip: guess which country peers come from'
  'python-geoip2: guess which country peers come from'
  'python-pyperclip: copy magnet links to the system clipboard')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7fe1a873465c3bbcc9c96c2447bcad56915249cc07b9ee232182d8975b4dfadd')

package() {
  install -Dm644 $pkgname-$pkgver/settings.cfg -t "$pkgdir/usr/share/$pkgname"
  make -C $pkgname-$pkgver PREFIX=/usr DESTDIR="$pkgdir" install
}
