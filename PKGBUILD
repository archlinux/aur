# Maintainer: Justin Dray <justin@dray.be>

pkgname='python-flask-cache'
pkgver=0.13.1
pkgrel=1
pkgdesc='Adds cache support to your Flask application'
arch=('any')
url='http://pypi.python.org/pypi/Flask-Cache'
license=('BSD')
depends=('python-flask')
makedepends=('python-distribute')
source=("http://pypi.python.org/packages/source/F/Flask-Cache/Flask-Cache-${pkgver}.tar.gz")
md5sums=('ab82a9cd0844891ccdb54fbb93fd6c59')
conflicts=('python-flask-cache-git')

build() {

  cd "${srcdir}/Flask-Cache-${pkgver}"
  python ./setup.py build

}

package() {

  cd "${srcdir}/Flask-Cache-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
