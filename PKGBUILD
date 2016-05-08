# Maintainer: Dylan <dylan@psilly.com>

pkgname=btbrowse
pkgver=0.0.1
pkgrel=1
pkgdesc='Opens bittorrent files or magnet links as a folder.'
url='https://github.com/acerix/btbrowse'
license=(GPL3)
arch=(any)
depends=(btfs xdg-utils python-xdg python-pytoml python-bencodepy)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('fec0efc51fb3d46fc9de97ede7bf13926d521c5c322def70e6d6f1b19c987a8f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=2
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
