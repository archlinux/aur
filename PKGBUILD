# Maintainer: Eli Fouts mail@elifouts.net
pkgname=walrgb
pkgver=0.1.0
pkgrel=1
pkgdesc="Sync motherboard, RAM, AIO, fan and GPU lighting to pywal colors through OpenRGB"
arch=('any')
url="https://github.com/elifouts/walrgb"
license=('MIT')
depends=('python' 'openrgb')
optdepends=('python-pywal16: color source' 'python-pywal: color source')
install=walrgb.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4bea95422bf3a7201d5fa30e62ae9c8abae3239087e23601715c32272ba985c8')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
