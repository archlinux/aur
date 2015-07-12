# Maintainer: Sebastien LEDUC <sebastien@sleduc.fr>
# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>

pkgname=('python-netaddr' 'python2-netaddr')
pkgver=0.7.15
_realname=netaddr
pkgrel=1
pkgdesc="A pure Python network address representation and manipulation library"
arch=('any')
license=('BSD')
url="http://github.com/drkjam/netaddr/"
source=("https://pypi.python.org/packages/source/n/netaddr/netaddr-${pkgver}.tar.gz")
md5sums=('bd024c8f82f71fd1d90553da64735f14')

prepare() {
  cp -a "${srcdir}/${_realname}-${pkgver}"{,-python2}
}

package_python-netaddr() {
  depends=("python")
  makedepends=("python-setuptools")
  optdepends=('ipython: used to work with the netaddr interractive command')

  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir"/ --optimize=1
}

package_python2-netaddr() {
  depends=("python2")
  makedepends=("python2-setuptools")
  optdepends=('ipython2: used to work with the netaddr interractive command')

  cd "$srcdir/$_realname-$pkgver-python2"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  mv ${pkgdir}/usr/bin/netaddr{,2}
}
# vim:set ts=2 sw=2 et:

