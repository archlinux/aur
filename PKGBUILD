# Maintainer: budRich
# Contributor: budRich

pkgname=i3ass
pkgver=2022.03.12
pkgrel=1
pkgdesc='A bash-script collection to assist the use of i3-wm.'
arch=('any')
url='https://github.com/budlabs/i3ass'
license=('MIT')
groups=()
depends=('bash>=4.0.0' 'i3-wm' 'gawk' 'sed')
makedepends=('lowdown')
optdepends=('rofi' 'xdotool')
provides=()
conflicts=('i3-gaps')
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
noextract=()
sha256sums=('e705b5970244a8b8fc7c0dce4b9349e304e54994e75da8dd778aeb5767406ac4')

package() {
  cd "$pkgname-$pkgver"

  make
  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
