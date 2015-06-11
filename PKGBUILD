# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-q
pkgver=2.5
pkgrel=1
pkgdesc='Quick-and-dirty debugging output for tired (Python) programmers'
arch=('any')
url='http://pypi.python.org/pypi/q/'
license=('Apache')
depends=('python')
source=("http://pypi.python.org/packages/source/q/q/q-$pkgver.tar.gz")
md5sums=('d4c4ee489dea818f85dfcfb9156fe8de')

package() {
  cd "$srcdir/q-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  # egg-info is not world-readable.
  chmod -R a+r "$pkgdir/usr/lib/"
}

