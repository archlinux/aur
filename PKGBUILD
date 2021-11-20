# Maintainer: Pavel Dvorak <dvorapa~seznam~cz>

pkgname=python-mwparserfromhell
pkgver=0.6.3
pkgrel=1
pkgdesc="Python package that provides an easy-to-use and outrageously powerful parser for MediaWiki wikicode."
arch=(any)
url=https://github.com/earwig/mwparserfromhell
license=(MIT)
makedepends=(python python-setuptools)
source=("https://files.pythonhosted.org/packages/source/m/mwparserfromhell/mwparserfromhell-$pkgver.tar.gz")
sha256sums=(1ad779f1bc0808d280ec1026c9de74f424de535568e21debd12830b5b0fa097e)

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
