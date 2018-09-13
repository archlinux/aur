# Maintainer: JP Cimalando <jp-dev@inbox.ru>

pkgbase=python-macholib
pkgname=('python-macholib' 'python2-macholib')
pkgver=1.11
pkgrel=1
pkgdesc="Mach-O header analysis and editing"
arch=('any')
url="https://bitbucket.org/ronaldoussoren/macholib/"
license=('MIT')
source=("https://files.pythonhosted.org/packages/72/60/2b22bef6edfb2864f7c0dc1d55b75e70ba1c3670899bead37e059e29b738/macholib-$pkgver.tar.gz")
sha512sums=('626cb564ea22e61a5b395c5ffbe9b17df0c341f2355bd0def88faabab52d2bc43f8f61871b50e7bd53147965627b4d3399f96a651bd985418e32b519b7bb03bb')

prepare() {
  cd "$srcdir"
  cp -a macholib-"$pkgver" macholib2-"$pkgver"
}

package_python-macholib() {
  depends=('python' 'python-altgraph')
  makedepends=('python-setuptools')
  cd "$srcdir/macholib-$pkgver"
  python setup.py install --root "$pkgdir"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README.txt "$pkgdir/usr/share/doc/$pkgname/README"
}

package_python2-macholib() {
  depends=('python2' 'python2-altgraph')
  makedepends=('python2-setuptools')
  cd "$srcdir/macholib2-$pkgver"
  python2 setup.py install --root "$pkgdir"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README.txt "$pkgdir/usr/share/doc/$pkgname/README"
  rm -rf "$pkgdir"/usr/bin
}

# vim:set et sw=2 ts=2 tw=79:
