# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=feed2maildir
pkgver=0.3.6
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
sha512sums=('b5f0ccf2d8b884ee0a8a006ef0bad9fe3ef7770681655e0b969b6bca8074bb0ff37f7fac704b8e6b7d2a66ec473e21ac43f43e4fc999b22d70a56c85771135cc')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
