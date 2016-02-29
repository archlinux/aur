# Maintainer: Christopher Arndt <aur at chrisarndt dot de>
# Contributor: Simon Conseil <contact+aur at saimon dot org>
# Contributor: Jesus Alvarez

pkgname=python-radon
pkgver=1.2.3
pkgrel=1
pkgdesc="A tool that computes various metrics for Python source code."
arch=('any')
url="https://radon.readthedocs.org/"
license=('MIT')
depends=('python-mando' 'python-colorama')
makedepends=('python-sphinx')
source=("http://pypi.python.org/packages/source/r/radon/radon-${pkgver}.tar.gz")
md5sums=('e0e8d61c3d6347ffed15d2eb84830520')

build() {
  cd "$srcdir/radon-$pkgver/docs"

  make html
}

package() {
  cd "$srcdir/radon-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -d "$pkgdir/usr/share/docs/$pkgname"
  cp -r docs/_build/html/* "$pkgdir/usr/share/docs/$pkgname"
}

# vim:set ts=2 sw=2 et:
