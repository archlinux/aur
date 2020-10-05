# Maintainer: Valère Monseur <archlinux at vale dot re>

pkgname=python-bootstrap-flask
pkgver=1.5
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
sha512sums=('c8919cad77da61a57c020d9d2aab477d8d871b5133f51add0d0b61d1a11da00312d74430c10eb108d54129359beb823ddbf45bf05cf3e141db75f23568d2dd4d')

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
