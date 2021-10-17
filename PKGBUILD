# Maintainer: budRich
# Contributor: budRich

pkgname=i3ass
pkgver=2021.10.17.0
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
sha256sums=('3a2f435f2d10a388c684cc8fa86097cfc62043929fa1a76e7c2d91ee2cc6c4c8')

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
