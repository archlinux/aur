# Maintainer: Pavel Dvorak <dvorapa~seznam~cz>

pkgname=python-mwparserfromhell
pkgver=0.6.2
pkgrel=1
pkgdesc="Python package that provides an easy-to-use and outrageously powerful parser for MediaWiki wikicode."
arch=(any)
url=https://github.com/earwig/mwparserfromhell
license=(MIT)
makedepends=(python python-setuptools)
source=("https://files.pythonhosted.org/packages/source/m/mwparserfromhell/mwparserfromhell-$pkgver.tar.gz")
sha256sums=(d3f74c0101f81ff73c61985b67f2e7048a30dc5f6a578ea1544e69133988d874)

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
