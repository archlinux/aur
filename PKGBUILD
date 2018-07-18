# Maintainer: Nils Kvist <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=i3ass
pkgver=0.1.7
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
source=("https://github.com/budlabs/$pkgname/archive/v.$pkgver.tar.gz")
noextract=()
sha256sums=('c352e22d8d252d8cbf8b9b532f126e360809684b168f4fdc7015265e2e9f6a3c')

package() {
  cd "$pkgname-v.$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
