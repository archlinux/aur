# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=ssrt
pkgver=2022.05.24.2
pkgrel=1
pkgdesc='simplescreenreocrder - now even simpler'
arch=('any')
url='https://github.com/budlabs/ssrt'
license=('BSD')
depends=('bash>=4.0.0' 'simplescreenrecorder' 'xorg-xrandr')
makedepends=(gawk)
optdepends=('slop: set recording geometry')
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=('afe344724b2277c01db2ddaa07f28126441e0abff7c2da42c7f59a30d2ada4c8')

# sha256sums=('SKIP')
# url='file:///home/bud/git/lab/ssrt'
# source=("${pkgname}-${pkgver}::git+$url")

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
