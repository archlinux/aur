# Maintainer: gosella <gosella@gmail.com>

pkgname=('python-sysv-ipc' 'python2-sysv-ipc')
pkgver=0.6.8
pkgrel=3
pkgdesc='System V IPC primitives (semaphores, shared memory and message queues) for Python'
arch=('any')
url='http://semanchuk.com/philip/sysv_ipc/'
license=('BSD')
groups=()
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("http://semanchuk.com/philip/sysv_ipc/sysv_ipc-$pkgver.tar.gz")
sha1sums=('c95c0854d7cddeb1cd12fc8a309a6d2b701e7af6')

build() {
  cd "$srcdir/sysv_ipc-$pkgver"

  python setup.py build
  python2 setup.py build
}

package_python-sysv-ipc() {
  depends=('python')

  cd "$srcdir/sysv_ipc-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-sysv-ipc() {
  depends=('python2')

  cd "$srcdir/sysv_ipc-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
