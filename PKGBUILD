# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=genmonify
pkgver=2020.11.23.1
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
sha256sums=('dedbb18e8b5ab1fe242b7d8886bfba249a848929284a4140a191a3d836bea587')

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
