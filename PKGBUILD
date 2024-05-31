# Maintainer: budRich
# Contributor: budRich
# Contributor: macxcool

pkgname=i3ass
pkgver=2024.04.21.2
pkgrel=1
pkgdesc='A bash-script collection to assist the use of i3-wm.'
arch=('any')
url='https://github.com/budlabs/i3ass'
license=('MIT')
depends=('bash>=4.0.0' 'i3-wm' 'gawk' 'xdotool')
makedepends=('gawk' 'sed')
optdepends=('i3menu')
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=('12bb3f3128099dbd2614d9ef28e547beb090d273904f22ca0b14153d3acf8c30')
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
