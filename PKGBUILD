# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: hobi82 <hobi82@gmx.net>
# Contributor: Marius Nestor <marius softpedia com>

# Check for new version:
# curl -s https://flavio.tordini.org/musictube-ws/release.xml | tr -dc 0-9.

pkgname=musictube
pkgver=1.17
pkgrel=1
pkgdesc="YouTube streaming music player"
arch=('x86_64')
url="https://flavio.tordini.org/musictube"
license=('unknown')
depends=('qt5-declarative' 'qt5-x11extras' 'mpv')
source=("$pkgname-$pkgver.deb::https://flavio.tordini.org/files/$pkgname/$pkgname.deb")
sha256sums=('59cac934ff4abba5667c978e428cca24d0f76a3d27502e8e8cee4dabf51b99a0')

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir"

  # Remove deprecated app menu
  rm -rf "$pkgdir/usr/share/menu"
}
