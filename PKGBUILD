# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname='python2-flask-restplus'
pkgver='0.8.6'
pkgrel='1'
pkgdesc='custom actions for flask to help manage your application'
arch=('any')
url='http://pypi.python.org/pypi/Flask-Restplus/'
license=('BSD')
depends=('python2-flask' 'python2-flask-restful' 'python2-jsonschema' 'python2-pytz' 'python2-aniso8601')
checkdepends=('python2-blinker' 'python2-rednose' 'python2-nose' 'python2-mock' 'python2-tzlocal')
makedepends=('setuptools')

source=("http://pypi.python.org/packages/source/f/flask-restplus/flask-restplus-${pkgver}.tar.gz")
sha1sums=('455788a4fa4cc9605760041974dbd7e4f46d9899')

build() {
  cd "flask-restplus-${pkgver}"
  python2 ./setup.py build
}

check() {
  cd "flask-restplus-${pkgver}"
  python2 ./setup.py test
}

package() {
  cd "flask-restplus-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --prefix="/usr"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
