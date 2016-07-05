# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Barthalion <echo YXVyQGJwaW90cm93c2tpLnBsCg== | base64 -d>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=sandbox
pkgver=2.11
pkgrel=1
pkgdesc="sandbox'd LD_PRELOAD hack"
arch=('i686' 'x86_64')
url='http://www.gentoo.org/'
license=('GPL')
source=(http://distfiles.gentoo.org/distfiles/$pkgname-$pkgver.tar.xz)
md5sums=('0580e04f2f8ff6ce44a020ff47e011ac')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
