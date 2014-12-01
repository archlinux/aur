# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=swish-e
pkgver=2.4.7
pkgrel=1
pkgdesc="Fast, flexible and free open source system for indexing collections of Web pages or other files"
arch=('i686' 'x86_64')
url="http://www.swish-e.org/"
license=('custom')
depends=('libxml2')
source=(http://www.swish-e.org/distribution/$pkgname-$pkgver.tar.gz)
md5sums=('736db7a65aed48bb3e2587c52833642d')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --with-zlib --prefix=/usr --mandir=/usr/share/man --libexecdir=/usr/lib
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
#license
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/$pkgname/COPYING
}
