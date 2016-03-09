# Maintainer: Znki <archzenki at gmail dot com>
pkgname='python2-flask-multistatic'
pkgver='1.0'
pkgrel='1'
pkgdesc='Simple Flask plugin to allow overriding static files.'
arch=('any')
url='http://pypi.python.org/pypi/flask-multistatic/'
license=('BSD')
depends=('python2-flask' 'python2')
makedepends=('setuptools')
#checkdepends=('python2-flatland') # aur package is broken

source=("http://pypi.python.org/packages/source/f/flask-multistatic/flask-multistatic-${pkgver}.tar.gz")
sha1sums=('50d8d6a4aeff0f7eead858441bec4d727aee0859' )

build() {
  cd "flask-multistatic-${pkgver}"
  python2 setup.py build
}

check() {
  cd "flask-multistatic-${pkgver}"
  #python2 setup.py test
}

package() {
  cd "flask-multistatic-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --prefix="/usr"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
