# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Veeti Paananen <veeti.paananen@rojekti.fi>

pkgname=porg
pkgver=0.10
pkgrel=1
pkgdesc="A program to aid management of software packages installed from source code"
arch=('i686' 'x86_64')
url="http://porg.sourceforge.net/"
license=('GPL')
depends=('bash')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('48f8433193f92097824ed7a72c4babafb29dc2ffe60e7df3635664f59f09cedd')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # TODO split grop
  ./configure --prefix=/usr --sysconfdir=/etc --disable-grop
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
