# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Gerardo Marset <gammer1994@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=wastesedge
pkgver=0.3.7
pkgrel=1
pkgdesc="Open source role playing game based on Adonthell engine"
arch=('any')
url="http://adonthell.nongnu.org/"
license=('GPL2')
depends=('adonthell' 'hicolor-icon-theme' 'desktop-file-utils')
source=(http://savannah.nongnu.org/download/adonthell/$pkgname-src-$pkgver.tar.gz)
sha256sums=('9b8861f071a995c40a17589ae477027730dafa63c86b07b02995f84c5a3cbe41')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
