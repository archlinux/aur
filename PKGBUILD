pkgbase=python-pygal-maps-world
pkgname=('python-pygal-maps-world' 'python2-pygal-maps-world')
_pyname=pygal_maps_world
pkgver=1.0.2
pkgrel=1
pkgdesc='World maps for pygal'
arch=('any')
url='http://pygal.org/'
license=('LGPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('8987fcf7f067b56f40f2f83b4f87baf9456164bbff0995715377020fc533db0f')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  cp -pr "${srcdir}/${_pyname}-${pkgver}" "${srcdir}/${_pyname}-${pkgver}-py2"
}

package_python-pygal-maps-world() {
  depends=('python-pygal>=2')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-pygal-maps-world() {
  depends=('python2-pygal>=2')
  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
