# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Ryan Coyner <rcoyner@gmail.com>

pkgbase=python-soappy
pkgname=python2-soappy
pkgver=0.12.20
pkgrel=1
pkgdesc="A module which implements a high-level interface to SOAP functions"
arch=('any')
url="http://pywebsvcs.sourceforge.net/"
license=('custom')
makedepends=("python2-setuptools")
depends=('python2-fpconst' 'python2-wstools')
conflicts=('python-soappy<=0.12.0-10')
replaces=('python-soappy<=0.12.0-10')
optdepends=('python2-m2crypto: for support for server-side SSL')
source=("https://pypi.python.org/packages/source/S/SOAPpy/SOAPpy-${pkgver}.zip"
        "https://raw.githubusercontent.com/kiorky/SOAPpy/develop/LICENSE")
md5sums=('99c90ed7f46e4e847ffb3fe156c806c5'
         '43f41fd631f225d8cd67eca52f38514f')

build() {
  cd SOAPpy-${pkgver}
  python2 setup.py build
}

package_python2-soappy() {
  cd SOAPpy-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
