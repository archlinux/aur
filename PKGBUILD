pkgname=pasmotd
pkgver=1.0.1
pkgrel=2
pkgdesc="Program to output an ANSI-Formatted MOTD in console"
arch=('x86_64')
url="https://github.com/FelixEcker/pasmotd"
license=('ISC')
depends=('fpc>=3.2.2-5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d7ab237234b3eff989b6f454d09fce2477ab24ef7425396511ac8ee18fc40dda')

build() {
  cd "$pkgname-$pkgver"
  echo ":: Make sure you have fpc 3.2.2 or newer installed."
  sh build.sh
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 out/pasmotd -t "$pkgdir/usr/bin/"
}
