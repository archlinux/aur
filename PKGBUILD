# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>


_name=pytango
pkgname=python-$_name
pkgver=9.4.0
pkgrel=1
pkgdesc="A python binding for the Tango control system"
arch=('x86_64' 'armv7h' 'aarch64')
url='https://pytango.readthedocs.io/en/stable/'
license=('LGPL3')
groups=('tango-controls')
depends=('tango-cpp>=9.4.0' 'boost' 'python-numpy' 'python-six'
	 'python-gevent' 'python-pytest' 'python-psutil')
makedepends=(python-setuptools python-sphinx python-sphinx_rtd_theme)
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bc22fe5f06ac0e0ff4affcbd18b65b2d1367f34e20b8b2f11e1182b376737a68')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
