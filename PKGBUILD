# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=filelock
pkgname="python-$_pyname"
pkgver=3.0.4
pkgrel=1
pkgdesc="A platform independent file lock for Python"
arch=('any')
url="https://filelock.readthedocs.org/"
license=('UNLICENSE')
depends=('python')
makedepends=()
source=("https://pypi.io/packages/source/f/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('011327d4ed939693a5b28c0fdf2fd9bda1f68614c1d6d0643a89382ce9843a71')

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 README.rst "$pkgdir/usr/share/doc/${pkgname}/README.rst"
  install -Dm 644 LICENSE.rst "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
