# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=filelock
pkgname="python-$_pyname"
pkgver=2.0.8
pkgrel=1
pkgdesc="A platform independent file lock for Python"
arch=('any')
url="https://filelock.readthedocs.org/"
license=('custom:UNLICENSED')
depends=('python')
makedepends=('git')
source=("https://pypi.io/packages/source/f/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('7e48e4906de3c9a5d64d8f235eb3ae1050dfefa63fd65eaf318cc915c935212b')

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 README.rst "$pkgdir/usr/share/doc/${pkgname}/README.rst"
  install -Dm 644 LICENSE.rst "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
