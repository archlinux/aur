# Maintainer: bud
# Contributor: bud

pkgname=i3menu
pkgver=0.3.0
pkgrel=1
pkgdesc='wrapper for dmenu(-bud) optimized for i3fyra'
arch=('any')
url='https://github.com/budlabs/i3menu'
license=('MIT')
depends=('bash>=4.0.0' 'dmenu-bud' 'gawk')
makedepends=('gawk')
optdepends=('xdotool' 'i3ass')
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=('632885adc0f30c81150e31e93a891da8295aba12e8534aa412c2a9d4c3bf4995')
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
