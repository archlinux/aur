# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=ponypipe
pkgver=1.2.3
pkgrel=1
pkgdesc="Ponify and deponify text"
arch=('any')
url="https://github.com/maandree/ponypipe"
license=('Public Domain')
depends=('java-runtime>=6')
makedepends=('java-environment>=6' 'bash')
provides=('ponypipe')
conflicts=('ponypipe')
source=(https://github.com/maandree/$pkgname/tarball/v$pkgver)
sha256sums=(4a18612368f40bfe110990d98607ff80325f9f26b640949cc9c451636dea5204)

build() {
  cd maandree-$pkgname-*
  make -B
}

package() {
  cd maandree-$pkgname-*
  make DESTDIR="$pkgdir/" install
}
