# Maintainer: Jelle van der Waa <jelle@archlinux.org>

_pyname=flask-talisman
pkgbase=python-flask-talisman
pkgname=('python-flask-talisman' 'python2-flask-talisman')
pkgver=0.2.0
pkgrel=1
pkgdesc='HTTP security headers for Flask'
url='https://github.com/GoogleCloudPlatform/flask-talisman'
arch=('any')
license=('APACHE')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${pkgname}-${pkgver}.tar.gz"::https://github.com/GoogleCloudPlatform/flask-talisman/archive/v${pkgver}.tar.gz)
md5sums=('d141d90c95ad34234578eeb8a012825f')

package_python-flask-talisman() {
  depends=('python-flask')
  cd ${_pyname}-${pkgver}

  python setup.py install --root="${pkgdir}" -O1
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python2-flask-talisman() {
  depends=('python2-flask')
  cd ${_pyname}-${pkgver}

  python2 setup.py install --root="${pkgdir}" -O1
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
