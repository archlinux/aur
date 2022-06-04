# Maintainer: budRich
# Contributor: budRich

pkgname=i3ass
pkgver=2022.05.22.1
pkgrel=1
pkgdesc='A bash-script collection to assist the use of i3-wm.'
arch=('any')
url='https://github.com/budlabs/i3ass'
license=('MIT')
depends=('bash>=4.0.0' 'i3-wm' 'gawk' 'sed')
makedepends=('gawk' 'sed')
optdepends=('rofi' 'xdotool')
conflicts=('i3-gaps')
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=('4c9592e3d58a6887242c4a923403c4435191613e17766a1bd8e2df8a21c804b4')
_trgdir="$pkgname-$pkgver"

# _trgdir="$pkgname"
# sha256sums=('SKIP')
# url='file:///home/bud/git/i3ass'
# source=("${pkgname}::git+$url")

package() {
  cd "$_trgdir"

  make DESTDIR="$pkgdir/" PREFIX=/usr
  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
