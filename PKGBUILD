# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=yeahlaunch
pkgver=0.4
pkgrel=1
pkgdesc="Very simple application launcher which puts a horizontal menu on top of your screen."
arch=(i686 x86_64)
url="http://phrat.de/yeahtools.html"
license=('GPL')
groups=('yeahtools')
depends=('libx11')
makedepends=('gcc' 'make')
#install=
#source=(http://phrat.de/$pkgname-$pkgver.tar.gz)
source=(https://bstern.org/$pkgname/$pkgname-$pkgver.tar.xz)
sha512sums=('81ed8501b2af5b800ec1f682267faa6125bb9b5440fe5d524ae10a1248fbddca21c71701aeebefd02049bd9887aea2cf01b7362b30c3256c8b27c9839cfd92b4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 0755 yeahlaunch "$pkgdir/usr/bin/yeahlaunch"
  install -D -m 0644 README "$pkgdir/usr/share/yeahtools/yeahlaunch.README"
}
# vim:set ts=2 sw=2 et:
