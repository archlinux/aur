# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=python-pytango
_pkgname=pytango
pkgver=9.3.4
pkgrel=1
pkgdesc="Python binding for Tango, a library dedicated to distributed control systems."
groups=('tango-controls')
arch=('x86_64' 'armv7h')
url="http://pytango.readthedocs.io/"
license=('GPL3')
depends=('python' 'python-six>=1.10' 'python-numpy>=1.1' 'python-setuptools'
	 'python-gevent' 'boost-libs' 'tango-cpp' 'boost')
conflicts=('python-pytango-git')
source=("https://gitlab.com/tango-controls/pytango/-/archive/v${pkgver}/pytango-v${pkgver}.tar.gz")
sha256sums=('f1cf08b2ca6a62c7f6e77920b5d0ece98f90a5fd0d291ff6e35c6134c66e887e')


build() {
  cd "$_pkgname-v$pkgver"
  python setup.py build
}

check() {
  cd "$_pkgname-v$pkgver"
  python setup.py check -mr
}

package() {
  cd "$_pkgname-v$pkgver"
  python setup.py install --root=$pkgdir/
}
