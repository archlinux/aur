# Maintainer: Immae <ismael.bouya@normalesup.org>

pkgname="python-pybtex"
_pkgname="pybtex"
pkgver="0.21"
pkgrel=2
pkgdesc="Pybtex reads citation information from a file and produces a formatted bibliography."
arch=("any")
url="http://pybtex.sourceforge.net"
license=("GPL")
depends=("python" "python-yaml" "python-latexcodec")
makedepends=("python-distribute")
source=("https://pypi.io/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('af8a6c7c74954ad305553b118d2757f68bc77c5dd5d5de2cc1fd16db90046000')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix="/usr" --root="${pkgdir}"
}
