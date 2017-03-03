# Maintainer: Simon Hanna <simon DOT hanna at serve-me dot info>
pkgname=('python-django-ical' 'python2-django-ical')
pkgver=1.4
pkgrel=1
pkgdesc="iCal feeds for Django based on Django's syndication feed framework"
arch=('any')
url="https://github.com/pinkerton/django-ical"
license=('MIT')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://github.com/pinkerton/django-ical/archive/${pkgver}.tar.gz")
sha256sums=('92f77e3ec91f09d2d3c967b339e831abf6c17ae615cdc02b418f1575dea62419')

check() {
  cd ${srcdir}/django-ical-${pkgver}
  python setup.py test
  cd ${srcdir}/django-ical-${pkgver}-py2
  python2 setup.py test
}

package_python-django-ical() {
  depends=('python-django' 'python-icalendar')
  cd ${srcdir}/django-ical-${pkgver}
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --prefix=/usr --root=${pkgdir}
}

package_python2-django-ical() {
  depends=('python2-django' 'python2-icalendar')
  cd ${srcdir}/django-ical-${pkgver}-py2
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
