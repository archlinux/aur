# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=filelock
pkgname="python-$_pyname"
pkgver=2.0.7
pkgrel=1
pkgdesc="A platform independent file lock for Python"
arch=('any')
url="https://filelock.readthedocs.org/"
license=('custom:UNLICENSE')
depends=('python')
makedepends=('git')
source=("https://pypi.io/packages/source/f/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('bdff3edefb9d1df7d40ce9b653adfafd4ba7e2105bc8de78c65aa03641f8ee16')

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 README.rst "$pkgdir/usr/share/doc/${pkgname}/README.rst"
  install -Dm 644 LICENSE.rst "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
