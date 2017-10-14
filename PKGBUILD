# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Francois Garillot <francois[@]garillot.net>
# Contributor: György Balló <ballogy@freestart.hu>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=xzgv
pkgver=0.9.2
pkgrel=1
pkgdesc="A picture viewer for X, with a thumbnail-based file selector"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/xzgv/"
license=('GPL')
depends=('gtk2' 'libexif')
optdepends=('xterm: open help files')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('25a240bb8c4a85c3979ce1a39c81c859724b490c1fd83dd4e3ef1db053ee819e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make all
  make info
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/share/pixmaps"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/app-install/desktop"

  make PREFIX="$pkgdir/usr" install
}
