# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname="python-pystray"
pkgver=0.17.2
pkgrel=1
arch=('any')
license=('GPL3')
pkgdesc="Allows to create a system tray icon"
url="https://github.com/moses-palmer/pystray"
depends=('python-six' 'python-pillow' 'python-xlib>=0.17' 'libappindicator-gtk3')
makedepends=('python>=3.4' 'python-setuptools' 'python-pip' 'python-wheel')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::https://github.com/moses-palmer/pystray/archive/v${pkgver}.tar.gz")
sha512sums=('d9e7f8896e177ecab9998fce8ec23a8a030525d114f7f546471c0995bbea23b698870ae084d56ad091a46e0b14047a68aa7f5dd0f2edf1a2479704408ecc6435')

build() {
  cd "pystray-$pkgver"
  python setup.py build
}

package_python-pystray() {
  cd "pystray-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
