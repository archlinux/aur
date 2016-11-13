# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgbase=python-requests-cache
_pyname=requests-cache
pkgname=('python-requests-cache' 'python2-requests-cache')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
pkgver=0.4.12
pkgrel=2
pkgdesc="Persistent cache for requests library"
arch=('any')
url="https://github.com/reclosedev/requests-cache"
license=('BSD')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/reclosedev/${_pyname}/archive/v${pkgver}.tar.gz")
sha512sums=('06d563d59c24f311209b81beb96130b75d1e849e0bb94ad636b3ac269eed7c89fdddfed8da86560473c4463425ea98953d30fb3da05efd614907855f130587fc')

package_python-requests-cache() {
  depends=('python')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"

}

package_python2-requests-cache() {
  depends=('python2')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"

}

# vim:set et sw=2 ts=2 tw=79:
