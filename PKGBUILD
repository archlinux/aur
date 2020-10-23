pkgname=discover-overlay-git
pkgver=v0.3.3.r0.g5f0d0d9
pkgrel=1
pkgdesc="Yet another discord overlay for linux written in Python using GTK3"
url="https://github.com/trigg/Discover"
arch=('x86_64')
license=('GPL3')
depends=('python-cairo' 'python-gobject' 'python-pidfile' 'python-pyxdg' 'python-websocket-client')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/trigg/Discover.git")
sha512sums=('SKIP')

pkgver() {
  cd Discover
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd Discover
    python3 setup.py build
}

package() {
    cd Discover
    python3 setup.py install --root="${pkgdir}"
}
