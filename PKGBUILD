# Maintainer: Quan Guo <guotsuan@gmail.com>

pkgname=python2-astroml-addons-git
_pkgname=astroML_addons
pkgver=2013.12.11.gb6d3e97
pkgrel=1
pkgdesc="AstroML addons package contains addon code for the astroML package. AstroML is a Python module for machine learning and data mining built on numpy, scipy, scikit-learn, and matplotlib."

url='http://www.astroml.org/'
arch=('any')
license=('BSD-3-Clause')
depends=('python2-numpy' 'python2-scipy' 'python2-scikit-learn'
          'python2-matplotlib' 'python2' 'python2-pyfits')

source=("git+https://github.com/astroML/${_pkgname}.git")


md5sums=('SKIP')


pkgver() {
      cd "${srcdir}/${_pkgname}"
      git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}"
  python2 ./setup.py install --root="${pkgdir}" --prefix=/usr
  #python2 ./setup_addons.py install --root="${pkgdir}" --prefix=/usr
  #install -dm755 ${pkgdir}/usr/share/astroML/examples/{algorithms,datasets,learning}
  #install -D -m644 examples/algorithms/* \
    #${pkgdir}/usr/share/astroML/examples/algorithms
  #install -D -m644 examples/datasets/* \
    #${pkgdir}/usr/share/astroML/examples/datasets
  #install -D -m644 examples/learning/* \
    #${pkgdir}/usr/share/astroML/examples/learning
  #install -D -m644 examples/README.rst ${pkgdir}/usr/share/astroML/examples

}
