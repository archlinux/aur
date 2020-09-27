pkgname=discover-overlay-git
pkgver=v0.1.1.r7.ge0b6f83
pkgrel=1
pkgdesc="Yet another discord overlay for linux written in Python using GTK3"
url="https://github.com/trigg/Discover"
arch=('x86_64')
license=('BSD')
depends=('python-gobject' 'python-pyxdg' 'python-websocket-client')
source=("git+https://github.com/trigg/Discover.git")
sha512sums=("SKIP")

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
