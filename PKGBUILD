# Maintainer: Sebastian Weiss <dl3yc at darc dot de>
pkgname=python-polt
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=0
pkgdesc="Python library to monitor and control user input devices"
arch=('any')
url="https://github.com/moses-palmer/pynput"
license=('LGPL3')
depends=('python-xdgspec')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7f69f52ae1e1407b33f2efc79a5cb44b8f5c3d034f764a0d665cbcd18216dc9b')

prepare() {
  cd "$_name-$pkgver"
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
