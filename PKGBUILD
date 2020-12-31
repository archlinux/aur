# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=tuxpaint-stamps
pkgver=2020.12.27
pkgrel=1
pkgdesc='Additional stamps for Tux Paint'
arch=('any')
url='http://tuxpaint.org/'
license=('GPL')
optdepends=('tuxpaint')
options=('!strip')
source=("https://downloads.sourceforge.net/tuxpaint/$pkgname-$pkgver.tar.gz")
sha256sums=('df53bbd866d4b045e8148f7271efd7d4c3e689f4511796ab31d4b95a98733235')

build() {
  make -C "$pkgname-$pkgver" PREFIX=/usr
}

package() {
  make -C "$pkgname-$pkgver" DATA_PREFIX="$pkgdir/usr/share/tuxpaint/" install-all
}

# vim: ts=2 sw=2 et:
