# Maintainer: Quan Guo <guotsuan@gmail.com>

pkgname=(python-astroml-addons-git python2-astroml-addons-git)
pkgbase=python2-astroml-addons-git
_pkgname=astroML_addons
pkgver=2015.08.18.g660e18c
pkgrel=2
pkgdesc="AstroML addons package contains addon code for the astroML package. AstroML is a Python module for machine learning and data mining built on numpy, scipy, scikit-learn, and matplotlib."

url='http://www.astroml.org/'
arch=('any')
license=('BSD-3-Clause')
#depends=('python-astroml' 'python2-astroml')

source=("git+https://github.com/astroML/${_pkgname}.git")


md5sums=('SKIP')

prepare () {
  cp -a ${_pkgname}{,-py2}
}

pkgver() {
      cd "${srcdir}/${_pkgname}"
      git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

package_python2-astroml-addons-git() {
depends=('python2-astroml')
  conflicts=(python2-astroml-addons)
  provides=(python2-astroml-addons)

  cd "${srcdir}/${_pkgname}-py2"
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


package_python-astroml-addons-git() {
  depends=('python-astroml')
  conflicts=(python-astroml-addons)
  provides=(python-astroml-addons)

  cd "${srcdir}/${_pkgname}"
  python ./setup.py install --root="${pkgdir}" --prefix=/usr
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
