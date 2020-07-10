# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=typiskt
pkgver=2020.07.10.0
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
sha256sums=('102912c34392249198c476d8aa168debfe80f0ab25160acd53c415ff8818279d')

package() {
  ls
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
