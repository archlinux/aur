# Maintainer: Immae <ismael.bouya@normalesup.org>

pkgname=patacrep-git
pkgver=5.1.2.r17.g30eb8d62
pkgrel=1
pkgdesc="Engine for LaTeX songbooks"
arch=('any')
url="http://www.patacrep.com"
license=('GPL')
depends=('python' 'python-ply' 'python-jinja' 'python-chardet'
         'python-unidecode' 'texlive-fontsextra' 'texlive-latexextra'
         'python-argparse' 'lilypond')
makedepends=('python-setuptools')
source=("patacrep-git::git://github.com/patacrep/patacrep.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g' -e "s/^v//"
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package(){
  cd "$srcdir/$pkgname"
  python setup.py install --root="${pkgdir}"
}

