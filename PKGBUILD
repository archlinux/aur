# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Moritz Lipp <mlq@pwmt.org>

_pipname=flask-autoindex
pkgname=python-flask-autoindex
pkgver=0.6.6
pkgrel=1
pkgdesc="Flask-AutoIndex generates an index page for your Flask application automatically"
arch=(any)
url="https://packages.python.org/Flask-AutoIndex/"
license=(BSD)
depends=(python-flask-silk python-future)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::"https://github.com/general03/flask-autoindex/archive/v$pkgver.tar.gz")
sha256sums=('e4f78cfab8d78d85bbb4e0572e8c0542fefa08fa5f872a749ac051893cf82d5f')

package() {
  cd $_pipname-$pkgver 
  python setup.py install --root="$pkgdir" --optimize=1

  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname
}
