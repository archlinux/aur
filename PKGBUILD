# Maintainer: budRich
# Contributor: budRich

pkgname=i3ass
pkgver=2020.08.11.1
pkgrel=1
pkgdesc='A bash-script collection to assist the use of i3-wm.'
arch=('any')
url='https://github.com/budlabs/i3ass'
license=('MIT')
groups=()
depends=('bash>=4.0.0' 'i3-wm' 'gawk' 'sed')
makedepends=()
optdepends=('rofi' 'xdotool')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
noextract=()
sha256sums=('a31b332ff5c4884f02dc4ae9bc34e111857920cc969e62e466b6967cd4d567b3')

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
