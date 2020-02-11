# Maintainer: Parker Reed <parker.l.reed@gmail.com>
# Contributor: Sven Klomp <mail@klomp.eu>
# Contributor: Mattheus Happe <mhappe@gmail.com>

pkgname=concordance-cli
_pkgsrcname=concordance
pkgver=1.4
pkgrel=1
pkgdesc='A CLI application for programming Logitech(R) Harmony(TM) remote controls.'
arch=('i686' 'x86_64')
url='http://www.phildev.net/harmony/index.shtml'
license=('GPL3')
depends=('libconcord=1.4')
source=("https://github.com/jaymzh/$_pkgsrcname/releases/download/v$pkgver/$_pkgsrcname-$pkgver.tar.bz2")
sha256sums=('e7484707926393c2b44ae5e21e978a597c0f50e210e13b9e1e8168e1476382c7')

build() {
  cd "$srcdir/$_pkgsrcname-$pkgver/$_pkgsrcname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgsrcname-$pkgver/$_pkgsrcname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
