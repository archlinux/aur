# Maintainer: Valère Monseur <archlinux at vale dot re>

pkgname=python-flask-moment
pkgver=0.11.0
pkgrel=1
pkgdesc="Formatting of dates and times in Flask templates using moment.js"
url="https://github.com/miguelgrinberg/Flask-Moment"
arch=('any')
license=('MIT')
depends=('python-flask')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/miguelgrinberg/Flask-Moment/archive/v${pkgver}.tar.gz")
sha512sums=('154378a038a3d84e48771dba295030c0b7b292ddca89e3ee17d608fc37f96aa1c5c0fd698352243866c55bd9fb723ccd34c0fa9321b8007117d322fdf47b4419')

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
