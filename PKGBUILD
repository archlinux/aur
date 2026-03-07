# Maintainer: willemw <willemw12@gmail.com>
# Contributor: George Angelopoulos <george@usermod.net>

pkgname=tremc
pkgver=0.9.6
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
sha256sums=('0f0aceb3ddc01f5b4784e2400a727e17e3f8875cd9107ac38b68d12b98ba8f00')

package() {
  install -Dm644 $pkgname-$pkgver/settings.cfg -t "$pkgdir/usr/share/$pkgname"
  make -C $pkgname-$pkgver PREFIX=/usr DESTDIR="$pkgdir" install
}
