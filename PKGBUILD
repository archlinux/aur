# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_pythonmod=flask-restplus
pkgname=('python2-flask-restplus' 'python-flask-restplus')
pkgbase='python2-flask-restplus'
pkgver=0.13.0
pkgrel=1
pkgdesc='custom actions for flask to help manage your application'
arch=('any')
url='http://pypi.python.org/pypi/Flask-Restplus/'
license=('BSD')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')

#source=("https://pypi.io/packages/source/f/flask-restplus/flask-restplus-${pkgver}.tar.gz")
source=("https://github.com/noirbizarre/flask-restplus/archive/${pkgver}.tar.gz")
sha256sums=('5fd64c04bf224912965df54d29efbab423e65ea52ec61f37cf5d0aec553723da')

check_python2-flask-restplus() {
  checkdepends=('python2-blinker' 'python2-rednose' 'python2-nose' 'python2-mock' 'python2-tzlocal')
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 ./setup.py test
}

package_python2-flask-restplus() {
  depends=('python2' 'python2-flask>=0.8' 'python2-six>=1.3.0' 'python2-jsonschema' 'python2-pytz' 'python2-aniso8601>=0.82')
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 ./setup.py install --root="${pkgdir}" --prefix="/usr"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

check_python-flask-restplus() {
  checkdepends=('python-blinker' 'python-rednose' 'python-nose' 'python-mock' 'python-tzlocal')
  cd ${srcdir}/${_pythonmod}-$pkgver
  python ./setup.py test
}

package_python-flask-restplus() {
  depends=('python' 'python-flask>=0.8' 'python-six>=1.3.0' 'python-jsonschema' 'python-pytz' 'python-aniso8601>=0.82')
  cd ${srcdir}/${_pythonmod}-$pkgver
  python ./setup.py install --root="${pkgdir}" --prefix="/usr"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
