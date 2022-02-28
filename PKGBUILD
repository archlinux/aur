# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname="python-pystray"
pkgver=0.19.2
pkgrel=1
arch=('any')
license=('GPL3')
pkgdesc="Allows to create a system tray icon"
url="https://github.com/moses-palmer/pystray"
depends=('python-six' 'python-pillow' 'python-xlib>=0.17' 'libappindicator-gtk3' 'python-gobject')
makedepends=('python>=3.4' 'python-setuptools' 'python-pip' 'python-wheel')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::https://github.com/moses-palmer/pystray/archive/v${pkgver}.tar.gz")
b2sums=('5ce792314499467cb6d4e1013dc29677f13b3dc679da70df6aba026e7202c4c86d31422132521c0764224a048f7a150f014060b36a42ccdf2e94a87f457f00f9')

build() {
  cd "pystray-$pkgver"
  python setup.py build
}

package_python-pystray() {
  cd "pystray-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
