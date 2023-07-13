# Maintainer: budRich
# Contributor: budRich

pkgname=i3ass
pkgver=2023.07.13.1
pkgrel=2
pkgdesc='A bash-script collection to assist the use of i3-wm.'
arch=('any')
url='https://github.com/budlabs/i3ass'
license=('MIT')
depends=('bash>=4.0.0' 'i3-wm' 'gawk' 'sed')
makedepends=('gawk' 'sed')
optdepends=('xdotool' 'i3menu')
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=('0ef5e4e7317a1e6834f16f34b5fa31c226ab4ce866bb6332d67b42c4d8e89a24')
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
