# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=ssrt
pkgver=2022.04.04.04
pkgrel=1
pkgdesc='simplescreenreocrder - now even simpler'
arch=('any')
url='https://github.com/budlabs/ssrt'
license=('BSD')
depends=('bash>=4.0.0' 'simplescreenrecorder' 'xorg-xrandr')
makedepends=(gawk)
optdepends=('slop: set recording geometry')
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
