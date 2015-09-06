# Maintainer: Sebastien LEDUC <sebastien@sleduc.fr>
# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>

pkgname=('python-netaddr' 'python2-netaddr')
pkgver=0.7.18
_realname=netaddr
pkgrel=2
pkgdesc="A pure Python network address representation and manipulation library"
arch=('any')
license=('BSD')
url="http://github.com/drkjam/netaddr/"
makedepends=('python' 'python2')
source=("https://pypi.python.org/packages/source/n/netaddr/netaddr-${pkgver}.tar.gz")
md5sums=('c65bb34f8bedfbbca0b316c490cd13a0')

prepare() {
  cp -a "${srcdir}/${_realname}-${pkgver}"{,-python2}
}

package_python-netaddr() {
  depends=("python")
  optdepends=('ipython: used to work with the netaddr interractive command')

  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir"/ --optimize=1
}

package_python2-netaddr() {
  depends=("python2")
  optdepends=('ipython2: used to work with the netaddr interractive command')

  cd "$srcdir/$_realname-$pkgver-python2"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  mv ${pkgdir}/usr/bin/netaddr{,2}
}
# vim:set ts=2 sw=2 et:

