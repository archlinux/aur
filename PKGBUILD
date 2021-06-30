# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=tuxpaint-stamps
pkgver=2021.06.28
pkgrel=1
pkgdesc='Additional stamps for Tux Paint'
arch=('any')
url='http://tuxpaint.org/'
license=('GPL')
optdepends=('tuxpaint')
options=('!strip')
source=("https://downloads.sourceforge.net/tuxpaint/$pkgname-$pkgver.tar.gz")
sha256sums=('1e849c5fb8535608a49d7160936602e443505bd202ffc378d649f11053e817cb')

build() {
  make -C "$pkgname-$pkgver" PREFIX=/usr
}

package() {
  make -C "$pkgname-$pkgver" DATA_PREFIX="$pkgdir/usr/share/tuxpaint/" install-all
}

# vim: ts=2 sw=2 et:
