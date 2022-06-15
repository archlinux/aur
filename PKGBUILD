# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=ssrt
pkgver=2022.06.14.1
pkgrel=1
pkgdesc='simplescreenreocrder - now even simpler'
arch=('any')
url='https://github.com/budlabs/ssrt'
license=('BSD')
depends=('bash>=4.0.0' 'simplescreenrecorder' 'xorg-xrandr')
makedepends=(gawk)
optdepends=('slop: set recording geometry')
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
sha256sums=('d1059060995824b9ef63117865b7474b1b808319f866d8644a5e97efb7a7a8d9')

# sha256sums=('SKIP')
# url='file:///home/bud/git/lab/ssrt'
# source=("${pkgname}-${pkgver}::git+$url")

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
