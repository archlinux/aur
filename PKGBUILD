# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=tuxpaint-stamps
pkgver=2021.11.25
pkgrel=1
pkgdesc='Additional stamps for Tux Paint'
arch=('any')
url='http://tuxpaint.org/'
license=('GPL')
optdepends=('tuxpaint')
options=('!strip')
source=("https://downloads.sourceforge.net/tuxpaint/$pkgname-$pkgver.tar.gz")
sha256sums=('cb55ee21b2d25b440ee216acfab0bb8d906af1c99adbc77e8db11eec30589d52')

build() {
  make -C "$pkgname-$pkgver" PREFIX=/usr
}

package() {
  make -C "$pkgname-$pkgver" DATA_PREFIX="$pkgdir/usr/share/tuxpaint/" install-all
}

# vim: ts=2 sw=2 et:
