# Maintainer: Karol Babioch <karol@babioch.de>

pkgname=('python-pyu2f' 'python2-pyu2f')
pkgver=0.1.4
pkgrel=1
pkgdesc="U2F host library for interacting with a U2F device over USB."
arch=('any')
url="https://github.com/google/pyu2f/"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
#options=('!emptydirs')
source=("git+https://github.com/google/pyu2f/#tag=$pkgver")
sha256sums=('SKIP')

package_python-pyu2f() {
  depends=(python)
  cd "$srcdir/pyu2f"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pyu2f() {
  depends=(python2)
  cd "$srcdir/pyu2f"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

