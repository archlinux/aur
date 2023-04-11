# Contributor: Vain <aurmaint1 on host: uninformativ dot de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lariza
pkgver=22.04
pkgrel=1
pkgdesc="Simple WebKit2GTK+ Browser"
arch=('i686' 'x86_64')
url="https://www.uninformativ.de/git/lariza"
license=('MIT')
depends=('webkit2gtk')
provides=("$pkgname")
conflicts=(${provides[@]})
source=("$url/archives/$pkgname-v$pkgver.tar.gz")
sha256sums=('51842e6dbc4873bc5cb7bcd6ecbc201c54202285d42de5b81273de280b1dd909')

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  make DESTDIR="$pkgdir" prefix="/usr" install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
