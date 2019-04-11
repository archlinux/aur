# Maintainer: Nikola Milinković <nikmil@gmail.com>
# Submitter: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgbase=python-req
pkgname=('python-req' 'python2-req')
pkgname=python-req
pkgver=1.0.0
_pkgcommit=de878f08f4fb28fa140c80d5cbdb04518ef5e968
pkgrel=1
pkgdesc="Simple python module for loading and dumping structures in req format."
arch=(any)
url="https://github.com/absperf/python-req"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://github.com/absperf/python-req/archive/${_pkgcommit}.tar.gz")
sha256sums=('67d0bf4c210aa5028cb1de5f83dd5825bc0475617870afa599ad67ff2873b289')

package_python2-req() {
  depends=('python2')
  pkgdesc="Simple python module for loading and dumping structures in req format. (python2 version)"
  
  cd "${srcdir}/${pkgbase}-${_pkgcommit}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -v -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/"
}

package_python-req() {
  depends=('python')
  pkgdesc="Simple python module for loading and dumping structures in req format. (python3 version)"

  cd "${srcdir}/${pkgbase}-${_pkgcommit}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -v -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/"
}
