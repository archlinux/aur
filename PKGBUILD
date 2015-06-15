# Contributor: Barthalion <echo YXVyQGJwaW90cm93c2tpLnBsCg== | base64 -d>
# Maintainer: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=sandbox
pkgver=2.6
pkgrel=2
pkgdesc="sandbox'd LD_PRELOAD hack"
arch=('i686' 'x86_64')
url='http://www.gentoo.org/'
license=('GPL')
depends=('glibc')
source=(http://distfiles.gentoo.org/distfiles/$pkgname-$pkgver.tar.xz)
md5sums=('83c63d4959c0ebe89685b83f4bbd9f23')

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
