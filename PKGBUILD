# Maintainer: Erik Johnson <palehose at gmail dot com>

pkgname=spellutils
pkgver=0.7
pkgrel=3
pkgdesc="Utilities to spell-check selectively"
arch=('i686' 'x86_64')
url="http://home.worldonline.dk/~byrial/spellutils/"
license=('GPL2')
depends=('gettext')
optdepends=('aspell: spell-checking utility')
source=(https://terminalmage.fedorapeople.org/aur/${pkgname}-${pkgver}.tar.bz2)
md5sums=('e2f64d49aabb359e79ba588e6c14c3c2')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
}
