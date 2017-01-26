# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=ponypipe
pkgver=1.2.4
pkgrel=1
pkgdesc="Ponify and deponify text"
arch=('any')
url="https://github.com/maandree/ponypipe"
license=('Public Domain')
depends=('java-runtime>=6')
makedepends=('java-environment>=6' 'bash')
source=(https://github.com/maandree/ponypipe/archive/${pkgver}.tar.gz)
sha256sums=(b501091dd54acbbc6cda075805fa20767bfc5955954a59b9ae72e31b88bef687)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make -B
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
