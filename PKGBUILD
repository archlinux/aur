# Mantainer: Michael M. Tung <mtung at mat dot upv dot es>

pkgname=pandoc-panflute
pkgver=1.11
pkgrel=2
pkgdesc='A Python package that makes creating Pandoc filters fun.'
url='https://github.com/sergiocorreia/panflute'
depends=('pandoc' 'python' 'python-pandocfilters' 'python-shutilwhich' 'python-future')
license=('BSD3')
arch=('any')

makedepends=('git')
provides=('pandoc-panflute-git')
conflicts=('pandoc-panflute-git')

source=('git://github.com/sergiocorreia/panflute.git')
md5sums=('SKIP')

pkgver() {
  curl -s https://raw.githubusercontent.com/sergiocorreia/panflute/master/panflute/version.py | sed -e "s/.*= '\(.*\)\..*'/\1/"
}

pkgrel() {
  curl -s https://raw.githubusercontent.com/sergiocorreia/panflute/master/panflute/version.py | sed -e "s/.*= '.*\..*\.\(.*\).*'/\1/"
}

package() {
    cd "$srcdir/panflute"
    python setup.py install --root="$pkgdir" --optimize=1 
}
