# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgbase=python-pdns
_pyname=pdns
pkgname=('python-pdns' 'python2-pdns')
makedepends=('python' 'python2')
pkgver=0.1.4
pkgrel=1
pkgdesc="Command line client to synchronize PowerDNS hosted zones with local zone files"
arch=('any')
url="https://pypi.python.org/pypi/pdns#downloads"
license=('BSD')
source=("https://pypi.python.org/packages/source/p/$_pyname/$_pyname-$pkgver.tar.gz")
sha512sums=('86f11cae4e6264109d0a1ce0fd11f26f557475563ee677648f15098f1430845f495b38a0a0383aa15b6f1ad1920b366ddac05a9879ef3e6c1a14cc74ef4289e0')

package_python-pdns() {
  depends=('python')
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install -O1 --root=$pkgdir
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

package_python2-pdns() {
  depends=('python2')
  cd "$srcdir/$_pyname-$pkgver"
  python2 setup.py install -O1 --root=$pkgdir
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set et sw=2 ts=2 tw=79:
