# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-q
pkgver=2.6
pkgrel=1
pkgdesc='Quick-and-dirty debugging output for tired (Python) programmers'
arch=('any')
url='http://pypi.python.org/pypi/q/'
license=('Apache')
depends=('python')
source=("http://pypi.python.org/packages/source/q/q/q-$pkgver.tar.gz")
md5sums=('0251ce38a2dce77917a8929d7968e035')

package() {
  cd "$srcdir/q-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  # egg-info is not world-readable.
  chmod -R a+r "$pkgdir/usr/lib/"
}

