# Mantainer: Michael M. Tung <mtung at mat dot upv dot es>

pkgname=pandoc-numbering
pkgver=3.0.2.r28.g8a69fd5
pkgrel=1
pkgdesc='A pandoc filter for numbering all kinds of things.'
url='https://github.com/chdemko/pandoc-numbering'
depends=('pandoc' 'python' 'python-pandocfilters' 'pandoc-xnos' 'python-pypandoc' 'python-panflute')
license=('BSD3')
arch=('any')

makedepends=('git')
provides=('pandoc-numbering-git')
conflicts=('pandoc-numbering-git')

source=('git://github.com/chdemko/pandoc-numbering.git')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/pandoc-numbering
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/pandoc-numbering"
    python setup.py install --root="$pkgdir" --optimize=1 
}
