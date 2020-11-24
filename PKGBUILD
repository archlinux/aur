# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=genmonify
pkgver=2020.11.24.2
pkgrel=1
pkgdesc='precision control for xfce4-panels genmon plugin'
arch=('any')
url='https://github.com/budlabs/genmonify'
license=('BSD')
groups=()
depends=('bash' 'sed' 'gawk')
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
sha256sums=('ae1468cbc44b3ac363308aec7d84a427ef06e5fa852c73a293b85b857c2456f6')

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
