# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname="python-pystray"
pkgver=0.19.4
pkgrel=1
arch=('any')
license=('GPL3')
pkgdesc="Allows to create a system tray icon"
url="https://github.com/moses-palmer/pystray"
depends=('python-six' 'python-pillow' 'python-xlib>=0.17' 'libappindicator-gtk3' 'python-gobject')
makedepends=('python>=3.4' 'python-setuptools' 'python-pip' 'python-wheel')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::https://github.com/moses-palmer/pystray/archive/v${pkgver}.tar.gz")
b2sums=('325bedd97a11e04f87a41f5fc206ed2a97c4693dc9d5ef52e12fdb72761d53af3a43a324e5d45db72d697e6f06e9a0c60b585b4935c4202d60f4e8e299df354a')

build() {
  cd "pystray-$pkgver"
  python setup.py build
}

package_python-pystray() {
  cd "pystray-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
