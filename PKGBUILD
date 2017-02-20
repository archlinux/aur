# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgbase=python-pypssl
_pyname=pypssl
pkgname=('python-pypssl' 'python2-pypssl')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
pkgver=2.1
pkgrel=3
pkgdesc="Python API for PSSL."
arch=('any')
url="https://pypi.python.org/pypi/pypssl"
license=('BSD2')
source=("${_pyname}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/p/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha512sums=('eca60c76dbe62ac9333c4eb693fe0842c4c31f1a637e102c5a079bd3f29623fb014533bd177788942b9142a35d980e4eb625188887afe05b79999e513aa31fd2')

package_python-pypssl() {
  depends=('python' 'python-requests' 'python-dateutil')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"

}

package_python2-pypssl() {
  depends=('python2' 'python2-requests' 'python2-dateutil')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  mv "${pkgdir}/usr/bin/pypssl"{,-py2} 

}

# vim:set et sw=2 ts=2 tw=79:
