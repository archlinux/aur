# Maintainer: bud
# Contributor: bud

pkgname=i3menu
pkgver=0.3.2
pkgrel=2
pkgdesc='wrapper for dmenu(-bud) optimized for i3fyra'
arch=('any')
url='https://github.com/budlabs/i3menu'
license=('MIT')
depends=('bash>=4.0.0' 'dmenu-bud' 'gawk')
makedepends=('gawk')
optdepends=('xdotool' 'i3ass')
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=('2abd57f0bcb5044cc70287ed56c732842a60d7711d0d1a03fb37359a3716ef38')
_trgdir="$pkgname-$pkgver"

# _trgdir="$pkgname"
# sha256sums=('SKIP')
# url='file:///home/bud/git/lab/i3menu'
# source=("${pkgname}::git+$url")

package() {
  cd "$_trgdir"

  make DESTDIR="$pkgdir/" PREFIX=/usr
  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
