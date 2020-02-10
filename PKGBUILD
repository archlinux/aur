# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgbase=python-pid
pkgname=(python-pid python2-pid)
pkgver=2.2.5
pkgrel=2
pkgdesc='Python pid - pidfile featuring stale detection and file-locking'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://pypi.python.org/pypi/pid'
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
# There's a gpg signature, but no matching key. Where to get it?
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/p/pid/pid-${pkgver}.tar.gz")
sha512sums=('01cb6af9a81b216af3b2e02c336589f4f1fb29b12dbdbefb817b78255157e175b16862c2bc01412460f9f754f2c7a073c9ec2a907e3290569af8bd9a2ee7081f')

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
