# Maintainer: gosella <gosella@gmail.com>

pkgname=('python-sysv-ipc' 'python2-sysv-ipc')
pkgver=1.0.0
pkgrel=1
pkgdesc='System V IPC primitives (semaphores, shared memory and message queues) for Python'
arch=('any')
url='http://semanchuk.com/philip/sysv_ipc/'
license=('BSD')
groups=()
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("http://semanchuk.com/philip/sysv_ipc/sysv_ipc-$pkgver.tar.gz")
sha1sums=('80c1fb36753c73c7517f914d1615ac2f5b1adbb8')

prepare() {
  cd "$srcdir/"
  cp -a "sysv_ipc-${pkgver}" "sysv_ipc-${pkgver}-py2"
}

package_python-sysv-ipc() {
  depends=('python')

  cd "$srcdir/sysv_ipc-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-sysv-ipc() {
  depends=('python2')

  cd "$srcdir/sysv_ipc-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
