# Maintainer: Christopher Arndt <aur at chrisarndt dot de>
# Contributor: Simon Conseil <contact+aur at saimon dot org>
# Contributor: Jesus Alvarez

pkgname=python-radon
pkgver=1.4.0
pkgrel=1
pkgdesc="A tool that computes various metrics for Python source code."
arch=('any')
url="https://radon.readthedocs.org/"
license=('MIT')
depends=('python-mando' 'python-colorama')
makedepends=('python-sphinx')
source=("https://pypi.python.org/packages/99/f9/31a0a3eb9e63bd8e3a3c44b4c676bf051ec05273ed09dcf00695ee8df318/radon-1.4.0.tar.gz")
md5sums=('52d5ab0564ceff5edb9b38d8c49cf544')


build() {
  cd "$srcdir/radon-$pkgver/docs"

  make html
}

package() {
  cd "$srcdir/radon-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -r docs/_build/html/* "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
