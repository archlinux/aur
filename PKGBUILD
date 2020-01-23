# Maintainer: JP Cimalando <jp-dev@inbox.ru>

pkgbase=python-macholib
pkgname=('python-macholib' 'python2-macholib')
pkgver=1.14
pkgrel=1
pkgdesc="Mach-O header analysis and editing"
arch=('any')
url="https://bitbucket.org/ronaldoussoren/macholib/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/0d/fe/61e8f6b569c8273a8f2dd73921738239e03a2acbfc55be09f8793261f269/macholib-$pkgver.tar.gz")
sha512sums=('362b59634d30af2e2fbbeb7a7c9178aaae57c09c88ad2ae93097b9af64df75dd5c656a779c7616a915883dcea52cb6ebf17bf8c7232d40c0bbe9880b3d5ca009')

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
