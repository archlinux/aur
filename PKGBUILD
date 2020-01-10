# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Moritz Lipp <mlq@pwmt.org>

_pipname=flask-autoindex
pkgname=python-flask-autoindex
pkgver=0.6.4
pkgrel=2
pkgdesc="Flask-AutoIndex generates an index page for your Flask application automatically"
arch=(any)
url="https://packages.python.org/Flask-AutoIndex/"
license=(BSD)
depends=(python-flask-silk python-future)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::"https://github.com/general03/flask-autoindex/archive/v$pkgver.tar.gz")
sha256sums=('44df9cc770d7fc30f8e90d77c468035329855b90aaff18bf4c2a7dc5fac63b77')

package() {
  cd $_pipname-$pkgver 
  python setup.py install --root="$pkgdir" --optimize=1

  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname
}
