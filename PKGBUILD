# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=typiskt
pkgver=2020.07.05.12
pkgrel=1
pkgdesc='touchtype training in the terminal'
arch=('any')
url='https://github.com/budlabs/typiskt'
license=('BSD')
groups=()
depends=('bash' 'bc' 'gawk' 'ncurses')
makedepends=()
optdepends=('curl')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
noextract=()
sha256sums=('1221b1a831358d566087d7334e48bfb65db86826370e4368ad54f48235250f73')

package() {
  ls
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
