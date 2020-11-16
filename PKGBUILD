# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=genmonify
pkgver=2020.11.16.7
pkgrel=1
pkgdesc='precision control for xfce4-panels genmon plugin'
arch=('any')
url='https://github.com/budlabs/genmonify'
license=('BSD')
groups=()
depends=('bash' 'sed')
makedepends=()
optdepends=('xfce4-genmon-plugin')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
noextract=()
sha256sums=('be6b63626da18ad7cad3e3144d3bd379c0526b1c7560437d656f3f60b2e19244')

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
