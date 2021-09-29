# Maintainer: JP Cimalando <jp-dev@inbox.ru>

pkgbase=python-macholib
pkgname=('python-macholib' 'python2-macholib')
pkgver=1.15.2
pkgrel=1
pkgdesc="Mach-O header analysis and editing"
arch=('any')
url="https://bitbucket.org/ronaldoussoren/macholib/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/c2/c1/09a06315332fc6c46539a1df57195c21ba944517181f85f728559f1d0ecb/macholib-$pkgver.tar.gz")
sha512sums=('ae0c3c3a14e15e412ff4ca3bb6a36a94ae3727494ed993fa623ebdcdfd7da2de1e4ef3484bc43aec780ae7bb95a6d32d1b26236813171bfa370029062a616d4f')

prepare() {
  cd "$srcdir"
  cp -a macholib-"$pkgver" macholib2-"$pkgver"
}

package_python-macholib() {
  depends=('python' 'python-altgraph')
  cd "$srcdir/macholib-$pkgver"
  python setup.py install --root "$pkgdir"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

package_python2-macholib() {
  depends=('python2' 'python2-altgraph')
  cd "$srcdir/macholib2-$pkgver"
  python2 setup.py install --root "$pkgdir"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
  rm -rf "$pkgdir"/usr/bin
}

# vim:set et sw=2 ts=2 tw=79:
