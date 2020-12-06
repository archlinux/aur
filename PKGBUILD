# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=feed2maildir
pkgver=0.3.8
pkgrel=2
pkgdesc="Read RSS/Atom feeds in your favourite, maildir-compatible email client"
arch=('any')
url="https://github.com/sulami/feed2maildir"
license=('ISC')
depends=('python' 'python-dateutil' 'python-feedparser' 'python-setuptools')
backup=()
options=(!emptydirs)
install=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('a95f5ca53aed2b25b86c6fe1c43578508763172c91524d1b4598ea32d63e437ac2533c61e58b72d207c3ab6823c014af70027efb991afa885fb5f56b24006ed2')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
