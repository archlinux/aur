# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=python-pytango
_pkgname=pytango
pkgver=9.3.6
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
sha256sums=('d5df7c01a5bb55c388ff83e478666dc3ac51dcd266e08ba3f51812dc90cd77f6')


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
