# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>


_name=pytango
pkgname=python-$_name
pkgver=9.4.1
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
sha256sums=('f00198e9d150a222a9711fafebbee7c688c79814128956e6c92f8c0e7f1605b7')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
