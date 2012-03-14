# $Id$
# Maintainer: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Fabio Volpe <volpefabio@gmail.com>

pkgname=python-sphinx
pkgver=1.1.2
pkgrel=3
pkgdesc='Python 3 documentation generator'
arch=('any')
url='http://sphinx.pocoo.org/'
license=('GPL')
depends=('python-distribute' 'python-jinja' 'python-pygments' 'python-docutils')
conflicts=('python2-sphinx')
optdepends=('texlive-latexextra: for generation of PDF documentation')
source=("http://pypi.python.org/packages/source/S/Sphinx/Sphinx-$pkgver.tar.gz")
md5sums=('b65a5d5d6172f3dcfefb4770ec63926e')
 
build() {
  cd Sphinx-$pkgver
  python setup.py build
}
 
package() {
  cd Sphinx-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 ft=sh et:
