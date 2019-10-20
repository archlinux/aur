# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=admesh
pkgver=0.98.4
pkgrel=1
pkgdesc="Program for processing STL triangulated solid meshes"
arch=('i686' 'x86_64')
url="https://github.com/admesh/admesh/"
license=('GPL2')
depends=('glibc')
source=("https://github.com/admesh/admesh/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('0500cce63664809cbf707df8bfdcee61')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
