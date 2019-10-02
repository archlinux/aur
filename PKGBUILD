# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=feed2maildir
pkgver=0.3.7
pkgrel=1
pkgdesc="Read RSS/Atom feeds in your favourite, maildir-compatible email client"
arch=('any')
url="https://github.com/sulami/feed2maildir"
license=('ISC')
depends=('python' 'python-dateutil' 'python-feedparser' 'python-setuptools')
backup=()
options=(!emptydirs)
install=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('9f46bed6899f1361741348d6e0facf34c0ddb4f82430542a54e1fc8b0f46a5b4fed8f9eb9f3d3885069508932c6dc378e3828a7200badedf62150ae786337156')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
