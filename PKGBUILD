# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
pkgname=mwlib.rl
pkgver=0.14.3
pkgrel=1
pkgdesc="Converts MediaWiki articles to pdf, odf, and docbook"
arch=('any')
url="http://code.pediapress.com/wiki/wiki"
license=("BSD")
depends=('python2' 'mwlib.ext' 'texvc' 'python2-pygments' 'fribidi' 'ploticus'
'imagemagick' 'ghostscript' 'ocaml' 'mwlib')
makedepends=('mercurial' 'python2-distribute' 'python2-docutils')
source=("http://pypi.python.org/packages/source/m/$pkgname/$pkgname-$pkgver.zip"
        'license.txt')
md5sums=('26954d7d58ed2f1c00bc9c4c9ee2630b'
         '472b2de7c34ecbd590240179882e36f8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir"
  install -D -m644 "$srcdir/license.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

