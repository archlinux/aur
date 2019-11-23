# Maintainer: Sebastien Leduc <sebastien AT sleduc DOT fr>

pkgname=('python-rpyc' 'python2-rpyc')
pkgbase='python-rpyc'
_realname=rpyc
pkgver=4.0.2
pkgrel=2
pkgdesc="Remote Python Call (RPyC), a transparent and symmetric RPC library"
url="http://rpyc.readthedocs.org"
arch=('any')
license=('MIT')
source=("https://files.pythonhosted.org/packages/ba/88/1cea477a4ad7c0f546a4c82aa367185be7b8fce512db8283e82de8454772/$_realname-$pkgver.tar.gz")
md5sums=('b6461956adf14ceda013b8d189c1a5e9')
makedepends=("python-setuptools" "python2-setuptools")

package_python-rpyc() {
  depends=('python' 'python-plumbum')
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir"/ --optimize=1
}

package_python2-rpyc() {
  depends=('python2' 'python2-plumbum')
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  mv "$pkgdir"/usr/bin/rpyc_classic{,2}.py
  mv "$pkgdir"/usr/bin/rpyc_registry{,2}.py
}
# vim:set ts=2 sw=2 et:
