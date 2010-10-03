# $Id$
# Maintainer: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Fabio Volpe <volpefabio@gmail.com>
pkgname=python-sphinx
pkgver=1.0.4
pkgrel=2
pkgdesc="Python documentation generator"
arch=('any')
url="http://sphinx.pocoo.org/"
license=('GPL')
depends=('setuptools' 'pygments' 'docutils' 'python-jinja')
optdepends=('texlive-latexextra: for generation of PDF documentation' 
            'texlive-latex3: for generation of PDF documentation')
source=(http://pypi.python.org/packages/source/S/Sphinx/Sphinx-$pkgver.tar.gz)
md5sums=('d4067e42e75525ecf108ece471ce97bb')

build() {
    cd "$srcdir/Sphinx-$pkgver"

    # python2 fix
    sed -i 's_#! /usr/bin/env python_#! /usr/bin/env python2_' sphinx/pycode/pgen2/token.py

    python2 setup.py install --root="$pkgdir" -O1
}
