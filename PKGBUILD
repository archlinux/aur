# Maintainer: Pavel Dvorak <dvorapa~seznam~cz>

pkgname=python-mwparserfromhell
pkgver=0.6.6
pkgrel=1
pkgdesc="Python package that provides an easy-to-use and outrageously powerful parser for MediaWiki wikicode."
arch=(any)
url=https://github.com/earwig/mwparserfromhell
license=(MIT)
makedepends=(python python-setuptools)
source=("https://files.pythonhosted.org/packages/source/m/mwparserfromhell/mwparserfromhell-$pkgver.tar.gz")
sha256sums=(71afec1e9784ba576e95d6f34845582d3c733a3a52ba770dd8a9c3a40e5b649f)

build() {
  cd "$srcdir/mwparserfromhell-$pkgver"
  python setup.py build
}

package() {
  depends=(python)
  conflicts=(python-mwparserfromhell-git)

  cd "$srcdir/mwparserfromhell-$pkgver"
  python setup.py install --optimize=1 --root="$pkgdir/" --skip-build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
