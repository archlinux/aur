# Maintainer: Veeti Paananen <veeti.paananen@rojekti.fi>
pkgname=porg
pkgver=0.8
pkgrel=1
pkgdesc="A program to aid management of software packages installed from source code"
arch=('i686' 'x86_64')
url="http://porg.sourceforge.net/"
license=('GPL')
depends=('bash')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('a3915768580658125572a6c68ff8cd7c927537bc26d02a8dc6294f6220e94e6b')

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

