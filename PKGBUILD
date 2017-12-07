# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgbase=python-zeep
pkgname=(python-zeep python2-zeep)
pkgver=2.4.0
pkgrel=1
pkgdesc='A modern/fast python SOAP client based on lxml / requests'
arch=('any')
url='https://github.com/mvantellingen/python-zeep'
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://github.com/mvantellingen/python-zeep/archive/$pkgver.tar.gz")
sha256sums=('8eebd0ad40b0a6c8b3c296d997e5d43a0f11de4193101abc8c7028a248496e1c')

package_python-zeep() {
  depends=('python' 'python-lxml' 'python-requests' 'python-six' 'python-isodate' 'python-defusedxml'
           'python-appdirs' 'python-cached-property' 'python-requests-toolbelt' 'python-pytz')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 "${srcdir}/${pkgbase}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-zeep() {
  depends=('python2' 'python2-lxml' 'python2-requests' 'python2-six' 'python2-isodate' 'python2-defusedxml'
           'python2-appdirs' 'python2-cached-property' 'python2-requests-toolbelt' 'python2-pytz')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 "${srcdir}/${pkgbase}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  # FIXME
#  python3 setup.py test
}
