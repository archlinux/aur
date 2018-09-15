# Maintainer: Nils Kvist <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=i3ass
pkgver=2018.09.15.0
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
sha256sums=('03f244e7bfb291e5ccd84c94fef84f4ad254f6d8868247c7bed73e8f30d01792')

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
