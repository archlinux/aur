# Maintainer: Brendan Van hook <brendan at vastactive dot com>

_pkgname=pymatbridge
pkgname=python-$_pkgname
pkgver=0.5.2
pkgrel=1
pkgdesc="A python interface to call out to Matlab."
arch=('any')
url="https://github.com/arokem/python-matlab-bridge"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
optdepends=('ipython: Matlab magic extension',
            'python-scipy: sparse array support')
source=('https://pypi.python.org/packages/b1/ff/c4534c370227f87f08a13a46c41d8f497ff8708b853bc218e3014480e641/pymatbridge-0.5.2.tar.gz')
md5sums=('a3a75cd4b504f8f7c5c181bcf0366dd4')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:ts=2:sw=2:et:
