# Maintainer: Daan Vanoverloop <daan at vanoverloop dot xyz>

pkgname=python-pyfzf-git
pkgdesc="A python wrapper for fzf"
pkgver=0.2.2.r0.g2e159c5
pkgrel=1
arch=('any')
license=('MIT')
depends=('python-plumbum')
makedepends=('git' 'python-setuptools')
provides=('python-pyfzf')
url="https://github.com/nk412/pyfzf"
source=("git://github.com/nk412/pyfzf.git")
sha256sums=('SKIP')

pkgver() {
    cd pyfzf
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd pyfzf
    python setup.py build
}

package() {
    cd pyfzf
    python setup.py install --root="$pkgdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

