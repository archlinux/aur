# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgbase=python-pid
pkgname=(python-pid python2-pid)
pkgver=3.0.3
pkgrel=1
pkgdesc='Python pid - pidfile featuring stale detection and file-locking'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://pypi.python.org/pypi/pid'
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
# There's a gpg signature, but no matching key. Where to get it?
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/p/pid/pid-${pkgver}.tar.gz")
sha512sums=('58c0615e22b1f0d1d1c3490c2be52c2ddc9bc1bb9a9f00379a2d9c2511371875d914bdcadce227f4478e968b8fdc469e7e67e4dbdb5c00449740aa7e097de3f1')

package_python-pid() {
  pkgdesc='Python pid - pidfile featuring stale detection and file-locking - python 3.x pkg'
  depends=('python')

  cd "${srcdir}/pid-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=0
}

package_python2-pid() {
  pkgdesc='Python pid - pidfile featuring stale detection and file-locking - python 2.x pkg'
  depends=('python2')

  cd "${srcdir}/pid-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=0
}
