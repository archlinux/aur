# $Id: PKGBUILD 276332 2017-12-28 05:13:56Z eschwartz $
# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Samuel Tardieu <sam@rfc1149.net>

pkgname=python2-slowaes
pkgver=0.1a1
pkgrel=3
pkgdesc="Implementation of AES in Python"
arch=('any')
url="https://code.google.com/archive/p/slowaes/"
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/s/slowaes/slowaes-$pkgver.tar.gz")
md5sums=('eafee95a788a795403e972a35e80ce4f')

package() {
  cd "$srcdir/slowaes-$pkgver"
  sed -i 's#/usr/bin/python#/usr/bin/python2#' aes.py
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
