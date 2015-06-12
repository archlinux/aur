# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=ponypipe
pkgver=1.2.2
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
md5sums=(5c91cf26c035333f711b81296cf6dedc)

build() {
  cd maandree-$pkgname-*
  make -B
}

package() {
  cd maandree-$pkgname-*
  make DESTDIR="$pkgdir/" install
}
