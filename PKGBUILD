# $Id: PKGBUILD 195765 2016-11-14 16:34:48Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Henrique C. Alves <hcarvalhoalves@gmail.com>

pkgname=matchbox-common
pkgver=0.9.1
pkgrel=7
pkgdesc="A package containing shared icons and configuration data"
arch=('any')
license=('GPL')
depends=('libmatchbox' 'matchbox-window-manager' 'matchbox-desktop' 'matchbox-panel')
url="http://matchbox-project.org/"
source=(https://downloads.yoctoproject.org/releases/matchbox/matchbox-common/0.9/matchbox-common-$pkgver.tar.bz2)
sha256sums=('524995b9899cc10d04c7964fb88ff8a2199865ca97e8d4988abd8d6c2a286199')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
