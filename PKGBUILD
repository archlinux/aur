# Maintainer: Karol Babioch <karol@babioch.de>

pkgname=('python-pendulum' 'python2-pendulum')
pkgver=1.4.4
pkgrel=1
pkgdesc="Python datetimes made easy"
arch=('any')
url="https://pendulum.eustace.io"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
#options=('!emptydirs')
source=("git+https://github.com/sdispater/pendulum.git#tag=$pkgver")
sha256sums=('SKIP')

package_python-pendulum() {
  depends=('python' 'python-tzlocal' 'python-pytzdata' 'python-dateutil')
  cd "$srcdir/pendulum"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pendulum() {
  depends=('python2' 'python2-tzlocal' 'python2-pytzdata' 'python2-dateutil')
  cd "$srcdir/pendulum"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

