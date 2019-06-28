# Contributor: Doron Behar <doron.behar@gmail.com>
# Maintainer: hexchain <i@hexchain.org>

_name=bashlex
pkgname=python-bashlex
pkgver=0.14
pkgrel=2
pkgdesc="Python port of the parser used internally by GNU bash"
arch=('any')
url="https://github.com/idank/bashlex"
license=('GPL3')
depends=('python')
makedepends=('perl')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('d32d1f929e2299660b5a7258068ac3708046c41d806223c8ecdc00b893548b2a')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -c 'import bashlex'
    perl -i -fpe "s|\\Q$srcdir/$_name-$pkgver\\E||g" bashlex/parsetab.py
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
