# Maintainer: Pavel Dvorak <dvorapa~seznam~cz>

pkgname=python-mwparserfromhell
pkgver=0.6.5
pkgrel=1
pkgdesc="Python package that provides an easy-to-use and outrageously powerful parser for MediaWiki wikicode."
arch=(any)
url=https://github.com/earwig/mwparserfromhell
license=(MIT)
makedepends=(python python-setuptools)
source=("https://files.pythonhosted.org/packages/source/m/mwparserfromhell/mwparserfromhell-$pkgver.tar.gz")
sha256sums=(2bad0bff614576399e4470d6400ba29c52d595682a4b8de642afbb5bebf4a346)

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
