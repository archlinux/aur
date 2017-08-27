# Maintainer: Kevin Rauwolf <sweetpea-aur AT tentacle DOT net>

pkgbase=python-u2flib-server
pkgname=(python-u2flib-server python2-u2flib-server)
pkgver=5.0.0
pkgrel=1
pkgdesc="Python based U2F server library"
arch=('any')
url="https://github.com/Yubico/python-u2lib-server"
license=('BSD')
source=("https://files.pythonhosted.org/packages/source/${pkgbase::1}/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
md5sums=('c87bc9984adf96e97aa35323dfc1edd4')
makedepends=('python2-six' 'python2-cryptography>=1.2' 'python2-enum34')

prepare() {
  cp -a "$srcdir/$pkgbase-$pkgver"{,-py2}
}

package_python-u2flib-server() {
  depends=('python-six' 'python-cryptography>=1.2')
  optdepends=('python-webob: u2f server example')
  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-u2flib-server() {
  depends=('python2-six' 'python2-cryptography>=1.2' 'python2-enum34')
  optdepends=('python2-webob: u2f server example')
  cd "$srcdir/$pkgbase-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
