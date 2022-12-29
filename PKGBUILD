# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-flask-sphinx-themes
pkgver=1.0.2
pkgrel=6
pkgdesc="Sphinx themes for Flask and related projects"
url="https://github.com/pallets/flask-sphinx-themes"
license=('BSD')
arch=('any')
depends=('python-sphinx')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pallets/flask-sphinx-themes/archive/$pkgver.tar.gz")
sha512sums=('b3cbdca9719b579d4e9644b51e187a87d49e3c82083a8fff649eef74eb7a475bcc0580bcd3012081048bcbbe001ce06f1cccbed39d2f30285cfedb2304f67af3')

build() {
  cd flask-sphinx-themes-$pkgver
  python setup.py build
}

package() {
  cd flask-sphinx-themes-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
