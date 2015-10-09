# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname='python2-flask-restplus'
pkgver='0.8.0'
pkgrel='1'
pkgdesc='custom actions for flask to help manage your application'
arch=('any')
url='http://pypi.python.org/pypi/Flask-Restplus/'
license=('BSD')
depends=('python2-flask')
makedepends=('setuptools')

source=("http://pypi.python.org/packages/source/f/flask-restplus/flask-restplus-${pkgver}.tar.gz")
sha1sums=('504f73ef0840478069d6188d582333f1722df45c')

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
