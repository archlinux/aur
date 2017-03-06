# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname='python2-flask-restplus'
pkgver='0.10.1'
pkgrel='1'
pkgdesc='custom actions for flask to help manage your application'
arch=('any')
url='http://pypi.python.org/pypi/Flask-Restplus/'
license=('BSD')
depends=('python2-flask>=0.8' 'python2-six>=1.3.0' 'python2-jsonschema' 'python2-pytz' 'python2-aniso8601>=0.82')
checkdepends=('python2-blinker' 'python2-rednose' 'python2-nose' 'python2-mock' 'python2-tzlocal')
makedepends=('python2-setuptools')

source=("https://pypi.io/packages/source/f/flask-restplus/flask-restplus-${pkgver}.tar.gz")
sha1sums=('d6162efccd7e7c794f435252adcf78a262cfa969')

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
