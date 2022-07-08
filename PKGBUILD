# Maintainer: JP Cimalando <jp-dev@inbox.ru>

pkgbase=python-macholib
pkgname=('python-macholib' 'python2-macholib')
pkgver=1.16
pkgrel=1
pkgdesc="Mach-O header analysis and editing"
arch=('any')
url="https://github.com/ronaldoussoren/macholib"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/16/1b/85fd523a1d5507e9a5b63e25365e0a26410d5b6ee89082426e6ffff30792/macholib-1.16.tar.gz")
sha512sums=('5a3b93275726b02a3cc93f272940a98c4543effbcfcfad741a0a5c3d6fde267ae388eabac8b776b37d87180196ad07cfae914a48430dbbd4d71ec157cf7b9766')

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
