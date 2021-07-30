# Maintainer: Daan Vanoverloop <daan at vanoverloop dot xyz>

pkgname=pymitter-git
pkgdesc="Python port of the extended Node.js EventEmitter 2 approach"
pkgver=v0.3.1.r0.g17acaf0
pkgrel=1
arch=('any')
license=('BSD')
depends=()
makedepends=('git' 'python-setuptools')
url="https://github.com/riga/pymitter"
source=("git://github.com/riga/pymitter.git")
sha256sums=('SKIP')

pkgver() {
    cd pymitter
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd pymitter
    python setup.py build
}

package() {
    cd pymitter
    python setup.py install --root="$pkgdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

