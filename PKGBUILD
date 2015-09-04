# Maintainer: crito <crito@cryptodrunks.net>
pkgname=python2-leap-common
pkgver=0.4.2
pkgrel=1
pkgdesc="Common utilities for leap python modules."
arch=('any')
url="https://github.com/leapcode/leap_pycommon"
license=('GPL3')
depends=('python2>=2.7'
         'openssl'
         'python2-dirspec'
         'python2-jsonschema'
         'python2-pyopenssl'
         'python2-dateutil'
         'python2-pyzmq'
         'python2-txzmq>=0.7.3'
         'python2-twisted>=14.0.2'
         'python2-service-identity'
         'python2-zope-interface')
source=("https://github.com/leapcode/leap_pycommon/archive/${pkgver}.tar.gz")
md5sums=('017f62ef9666e8af01380cacc8cd74cb')

package() {
  cd "${srcdir}/leap_pycommon-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 CHANGELOG "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
