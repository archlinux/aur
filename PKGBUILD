# Maintainer: shieldwed <shieldwed [at] outlook [dot] com>

pkgbase=python-iptools
pkgname=(python-iptools python2-iptools)
pkgver=0.7.0
pkgrel=1
pkgdesc="Collection of utilities for dealing with IP addresses"
url="http://python-iptools.readthedocs.org/"
license=('BSD')
arch=('any')
makedepends=(
  'python-setuptools'
  'python2-setuptools'
  )
source=(
  "LICENSE"
  "https://github.com/bd808/$pkgbase/archive/v$pkgver.tar.gz"
  )
sha256sums=('c85e8d34884219ec4ac360f28983b015953ec34b1c6d91e6afbb8b421626ea9e'
            '5ea59c0867e72d8243305ff1297fc5b2d8feaca650369a29985453ce4f39ca97')

package_python-iptools() {
  depends=('python')
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py install "--root=$pkgdir" --optimize=1
}

package_python2-iptools() {
  depends=('python2')
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "$srcdir/$pkgbase-$pkgver"
  python2 setup.py install "--root=$pkgdir" --optimize=1
}
