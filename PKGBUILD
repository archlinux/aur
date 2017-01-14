# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>
# Contributor: Low Kian Seong <kianseong@gmail.com>
pkgname='python2-flask-genshi'
pkgver='0.5.1'
pkgrel='2'
pkgdesc='An extension to Flask for easy Genshi templating.'
arch=('x86_64' 'i686')
url='http://pypi.python.org/pypi/Flask-Genshi/'
license=('BSD')
depends=('python2-flask' 'python2-genshi')
makedepends=('python2-setuptools')

source=("http://pypi.python.org/packages/source/F/Flask-Genshi/Flask-Genshi-${pkgver}.tar.gz")
sha1sums=('4609c294557d3e338db08676162da966e1bf585f')

build() {
  cd "Flask-Genshi-${pkgver}"
  python2 setup.py build
}

#check() {
#  cd "Flask-Genshi-${pkgver}"
#  #python2 setup.py test
#}

package() {
  cd "Flask-Genshi-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --prefix="/usr"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
