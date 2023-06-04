# Maintainer: budRich
# Contributor: budRich

pkgname=i3ass
pkgver=2023.06.04.1
pkgrel=1
pkgdesc='A bash-script collection to assist the use of i3-wm.'
arch=('any')
url='https://github.com/budlabs/i3ass'
license=('MIT')
depends=('bash>=4.0.0' 'i3-wm' 'gawk' 'sed')
makedepends=('gawk' 'sed')
optdepends=('xdotool' 'i3menu')
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=('be934653896901219e3c08d9d72506be3afb26b2986a6533dc1a6a09a9786829')
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
