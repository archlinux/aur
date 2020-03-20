# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgbase=python-pid
pkgname=(python-pid python2-pid)
pkgver=3.0.0
pkgrel=1
pkgdesc='Python pid - pidfile featuring stale detection and file-locking'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://pypi.python.org/pypi/pid'
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
# There's a gpg signature, but no matching key. Where to get it?
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/p/pid/pid-${pkgver}.tar.gz")
sha512sums=('594ff007c41696f35bb925ff47a1864ca9fa65cb9197f1fd42a5c4cd5914cfca37f355f69cd6dec4f7e6ce5d24e21f3648b2aefda4f372fb2d3e26cad3e8027f')

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
