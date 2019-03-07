# Maintainer: Nils Kvist <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=i3ass
pkgver=2019.03.07.2
pkgrel=1
pkgdesc='A bash-script collection to assist the use of i3-wm.'
arch=('any')
url='https://github.com/budlabs/i3ass'
license=('MIT')
groups=()
depends=('bash>=4.0.0')
makedepends=()
optdepends=('xdotool: floating window placement'  'i3-wm: duh')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/budlabs/$pkgname/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('91f9bd3ccf39b594ba7ca3825c3b3399c98faee4955a48567d6d8676c3cbe6af')

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr uninstall
  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
