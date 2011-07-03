# $Id$
# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Contributor: Fabio Volpe <volpefabio@gmail.com>
pkgname=python-sphinx
pkgver=1.0.7
pkgrel=3
pkgdesc="Python documentation generator"
arch=('any')
url="http://sphinx.pocoo.org/"
license=('GPL')
depends=('python2-distribute' 'python2-pygments' 'docutils' 'python2-jinja')
optdepends=('texlive-latexextra: for generation of PDF documentation'
            'texlive-latex3: for generation of PDF documentation')
source=(http://pypi.python.org/packages/source/S/Sphinx/Sphinx-$pkgver.tar.gz)
md5sums=('42c722d48e52d4888193965dd473adb5')

build() {
    cd "$srcdir/Sphinx-$pkgver"

    # python2 fix
    sed -i 's_#! /usr/bin/env python_#! /usr/bin/env python2_' sphinx/pycode/pgen2/token.py

    python2 setup.py install --root="$pkgdir" -O1
}
