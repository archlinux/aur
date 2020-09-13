# Maintainer: Valère Monseur <archlinux at vale dot re>

pkgname=python-flask-moment
pkgver=0.10.0
pkgrel=1
pkgdesc="Formatting of dates and times in Flask templates using moment.js"
url="https://github.com/miguelgrinberg/Flask-Moment"
arch=('any')
license=('MIT')
depends=('python-flask')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/miguelgrinberg/Flask-Moment/archive/v${pkgver}.tar.gz")
sha512sums=('fc09a707d242e57ba6f397ed114b678031b2fffde3f3d8049f58fabb1fe4e0c8426fd676087f8f772303eeaf97f586e4fe00ca27af6d972022f748bcd2a4728e')

build() {
  cd Flask-Moment-$pkgver
  python setup.py build
}

check() {
  cd Flask-Moment-$pkgver
  python setup.py pytest
}

package() {
  cd Flask-Moment-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
