# Maintainer: Khorne <khorne AT khorne DOT me>
# Contributor: Karol Babioch <karol@babioch.de>

pkgname=('python-tika' 'python2-tika')
pkgver=1.24
pkgrel=1
pkgdesc="Apache Tika Python library"
arch=('any')
url="http://github.com/chrismattmann/tika-python"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'git')
source=("git+https://github.com/chrismattmann/tika-python#tag=$pkgver")
sha256sums=('SKIP')

package_python-tika() {
  depends=(python)
  cd "$srcdir/tika-python"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-tika() {
  depends=(python2)
  cd "$srcdir/tika-python"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

