# Maintainer: Quan Guo <guotsuan@gmail.com>

pkgname=astroml-examples-git
_gitname=astroML
pkgver=2017.05.03.g33b2006
pkgrel=1


pkgdesc="AstroML is a Python module for machine learning and data mining built
on numpy, scipy, scikit-learn, and matplotlib. This package includes the
exmaples shipped with the github version of astroML"

url='http://www.astroml.org/'
arch=('any')
license=('BSD-3-Clause')

depends=()

optdepends=('python-astroml' 'python2-astroml')

source=("git+https://github.com/astroML/astroML.git")

conflicts=('astroml-examples' )

md5sums=('SKIP')


pkgver() {
      cd "${srcdir}/${_gitname}"
      git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

package() {

  cd "${srcdir}/${_gitname}"

  install -dm755 ${pkgdir}/usr/share/astroML/examples/{algorithms,datasets,learning}
  install -D -m644 examples/algorithms/* \
    ${pkgdir}/usr/share/astroML/examples/algorithms
  install -D -m644 examples/datasets/* \
    ${pkgdir}/usr/share/astroML/examples/datasets
  install -D -m644 examples/learning/* \
    ${pkgdir}/usr/share/astroML/examples/learning
  install -D -m644 examples/README.rst ${pkgdir}/usr/share/astroML/examples

}

