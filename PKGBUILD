# Maintainer: Valère Monseur <archlinux at vale dot re>

pkgname=python-bootstrap-flask
pkgver=1.5.1
pkgrel=1
pkgdesc="Bootstrap 4 helper for Flask/Jinja2"
url="https://github.com/greyli/bootstrap-flask"
arch=('any')
license=('MIT')
depends=('python-flask')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-flask-sqlalchemy' 'python-flask-wtf')
conflicts=('python-flask-bootstrap')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greyli/bootstrap-flask/archive/${pkgver}.tar.gz")
sha512sums=('6c4a3e928fe5fe3e9af84ce114cbf4a3b349c064412c22bd06e7e850a541c2ce4d62e97f5f18326208afd2231d9c14883a2418ddc8d16dd94af587c86e5b54ed')

build() {
  cd bootstrap-flask-"$pkgver"
  python setup.py build
}

check() {
  cd bootstrap-flask-"$pkgver"
  python setup.py test
}

package() {
  cd bootstrap-flask-"$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
