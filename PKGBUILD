# Maintainer: Christopher Loen <christopherloen at gmail dot com>

pkgbase='python-owslib-git'
pkgname=('python-owslib-git' 'python2-owslib-git')
pkgver='0.11_dev'
pkgrel=1
arch=('any')
url='http://geopython.github.io/OWSLib'
license=('BSD')
makedepends=('python-pip' 'python2-pip')
source=("git://github.com/geopython/OWSLib.git")
sha256sums=('SKIP')

package_python-owslib-git() {
  pkgdesc='Python package for client programming with Open Geospatial Consortium (OGC) web service interface standards, and their related content models'
  depends=('python-dateutil' 'python-pytz' 'python-requests' 'python-pyproj')
  conflicts=('python-owslib')
  cd OWSLib

  PIP_CONFIG_FILE=/dev/null pip3 install --prefix=/usr --isolated --root="${pkgdir}" --no-deps --ignore-installed .

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_python2-owslib-git() {
  pkgdesc='Python2 package for client programming with Open Geospatial Consortium (OGC) web service interface standards, and their related content models'
  depends=('python2-dateutil' 'python2-pytz' 'python2-requests' 'python2-pyproj')
  conflicts=('python2-owslib')
  cd OWSLib

  PIP_CONFIG_FILE=/dev/null pip2 install --prefix=/usr --isolated --root="${pkgdir}" --no-deps --ignore-installed .

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
