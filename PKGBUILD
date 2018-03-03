# Maintainer: JP Cimalando <jp-dev@inbox.ru>

pkgbase=python-macholib
pkgname=('python-macholib' 'python2-macholib')
pkgver=1.9
pkgrel=1
pkgdesc="Mach-O header analysis and editing"
arch=('any')
url="https://bitbucket.org/ronaldoussoren/macholib/"
license=('MIT')
source=("https://pypi.python.org/packages/70/54/12d547ebb73de8412120a293ab013e61caef36bf712d76c9a574020d2796/macholib-$pkgver.tar.gz")
sha512sums=('732cb5a5a262dd1f65d35c92bf43a0bfd65695ee150eb5c5b24543a2784be7e452ab9442f5b1d7b9a993b0c5e8c31c4f9a00723c4996c3998021fe7e02016bd1')

prepare() {
  cd "$srcdir"
  cp -a macholib-"$pkgver" macholib2-"$pkgver"
}

package_python-macholib() {
  depends=('python' 'python-altgraph')
  makedepends=('python-setuptools')
  cd "$srcdir/macholib-$pkgver"
  python setup.py install --root "$pkgdir" --optimize=1
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README.txt "$pkgdir/usr/share/doc/$pkgname/README"
}

package_python2-macholib() {
  depends=('python2' 'python2-altgraph')
  makedepends=('python2-setuptools')
  cd "$srcdir/macholib2-$pkgver"
  python2 setup.py install --root "$pkgdir" --optimize=1
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README.txt "$pkgdir/usr/share/doc/$pkgname/README"
  rm -rf "$pkgdir"/usr/bin
}

# vim:set et sw=2 ts=2 tw=79:
