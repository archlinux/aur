# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Immae <ismael.bouya@normalesup.org>

pkgname=patacrep-git
pkgver=5.2.0.r0.g7c19c636
pkgrel=2
pkgdesc="Engine for LaTeX songbooks"
arch=('any')
url="http://www.patacrep.com"
license=('GPL')
depends=('python' 'python-ply' 'python-jinja' 'python-chardet'
         'python-unidecode' 'texlive-fontsextra' 'texlive-latexextra'
         'lilypond' 'python-argdispatch')
makedepends=('python-setuptools' 'git')
source=("patacrep-git::git+https://github.com/patacrep/patacrep.git#branch=master")
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

