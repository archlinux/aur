# Maintainer: Dylan <dylan@psilly.com>

pkgname=btbrowse
pkgver=0.0.3
pkgrel=1
pkgdesc='Opens bittorrent files or magnet links as a folder.'
url='https://github.com/acerix/btbrowse'
license=(GPL3)
arch=(any)
depends=(btfs xdg-utils python-pyxdg python-pytoml python-bencodepy tk)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('c638039ae6c7f8bbf836eb78cda365bd8e19e809042c273a93cea5587625f253')

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

