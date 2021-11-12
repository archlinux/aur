# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=python-pytango
_pkgname=pytango
pkgver=9.3.3
pkgrel=1
pkgdesc="Python binding for Tango, a library dedicated to distributed control systems."
arch=('x86_64' 'arm')
url="http://pytango.readthedocs.io/"
license=('GPL3')
depends=('python' 'python-six>=1.10' 'python-numpy>=1.1' 'python-setuptools'
	 'python-gevent' 'boost-libs' 'tango-cpp')
conflicts=('python-pytango-git')
source=("https://gitlab.com/tango-controls/pytango/-/archive/v${pkgver}/pytango-v${pkgver}.tar.gz")
sha256sums=('5926e06fba42acd5c2376178fe87756ef42494ab3bc3e96f5289589ef2ff72fe')


build() {
  cd "$_pkgname-v$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-v$pkgver"
  python setup.py install --root=$pkgdir/
}
