# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-split
pkgname=("python-split" "python2-split")
pkgver=0.4
pkgrel=2
pkgdesc="Functions to split or partition sequences"
arch=('any')
url="https://bitbucket.org/astanin/python-split"
license=('MIT')
makedepends=('python' 'python2')
source=("https://pypi.io/packages/source/s/split/split-$pkgver.zip")
md5sums=('16e72d45b66b0f8da2349be0f82d5216')

prepare() {
  cp -a split-$pkgver{,-py2}
}

package_python-split() {
  depends=('python')

  cd split-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-split() {
  depends=('python2')

  cd split-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
