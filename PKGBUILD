pkgname=ggoban
pkgver=0.2
pkgrel=1
pkgdesc="A gtk go game interface to play and edit game records"
arch=('i686' 'x86_64')
url="https://launchpad.net/ggoban"
depends=('gtkmm')
optdepends=('gnugo: playing against the computer')
makedepends=('intltool')
source=(http://launchpad.net/ggoban/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
sha512sums=('52cde90ccf09a32e9cde6bebdcdde62f9b64a8a3a40a906b0676345bc5f93f9eada86283087b6c8755f66e1e3427e734d3b212ba4f47b72e46d4bdd17300f6ea')
license=('GPL')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr 
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
