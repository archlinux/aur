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
sha256sums=('ba9824f8d1cfd8423e4124d45a7050ea85234bc63530318015854b74fae14e89')

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
