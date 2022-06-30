# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=typiskt
pkgver=2022.06.30.1
pkgrel=1
pkgdesc='touchtype training in the terminal'
arch=('any')
url='https://github.com/budlabs/typiskt'
license=('BSD')
depends=('bash' 'bc' 'gawk' 'ncurses')
makedepends=('gawk')
optdepends=('curl')
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=('bf79f6d6af0254c1cfde288e33fc7da0ab526dd3c5c58b29cd89a9f67c6744a5')

# sha256sums=('SKIP')
# url='file:///home/bud/git/lab/typiskt'
# source=("${pkgname}-${pkgver}::git+$url")

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
