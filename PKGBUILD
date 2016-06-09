# Maintainer: Dylan <dylan@psilly.com>

pkgname=btbrowse
pkgver=0.0.2
pkgrel=1
pkgdesc='Opens bittorrent files or magnet links as a folder.'
url='https://github.com/acerix/btbrowse'
license=(GPL3)
arch=(any)
depends=(btfs xdg-utils python-xdg python-pytoml python-bencodepy tk)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('2b585a87e62c82ae97580ff2cd1d688e51ce154e123067cb9da62e4cfb8441db')

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

