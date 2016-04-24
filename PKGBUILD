# Contributor: sinkuu <sinkuupump@gmail.com>

pkgname=uclogic-tools
pkgver=4
pkgrel=1
pkgdesc="Show diagnostic information from UC-Logic graphics tablets (rebranded as Huion, Yiynova, Ugee, Monoprice, Turcom and others)"
arch=('i686' 'x86_64')
url="https://github.com/DIGImend/uclogic-tools"
license=('GPL2')
depends=('libusb')
source=("https://github.com/DIGImend/uclogic-tools/releases/download/v$pkgver/uclogic-tools-$pkgver.tar.gz")
sha1sums=('d8bbbe49490bb6681e55fc6790d31c787b7bf3d5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
