# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: hobi82 <hobi82@gmx.net>
# Contributor: Marius Nestor <marius softpedia com>
pkgname=musictube
pkgver=1.16
pkgrel=1
pkgdesc="YouTube streaming music player"
arch=('x86_64')
url="https://flavio.tordini.org/musictube"
license=('unknown')
depends=('qt5-declarative' 'qt5-x11extras' 'mpv')
source=("$pkgname-$pkgver.deb::https://flavio.tordini.org/files/$pkgname/$pkgname.deb")
sha256sums=('8d90ccad5a2dfe32cef7d823d82f8fb53ad456f021e5b1e2cfd874bc9a6695f3')

pkgver() {
  echo $(curl -s https://flavio.tordini.org/musictube-ws/release.xml | tr -dc 0-9.)
}

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir"

  # Remove deprecated app menu
  rm -rf "$pkgdir/usr/share/menu"
}
