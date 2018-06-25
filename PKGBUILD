pkgname=termtosvg-git
pkgver=0.2.2.r1.g8b37598
pkgrel=1

pkgdesc='record terminal sessions as svg animations'
url='https://github.com/nbedos/termtosvg'
arch=('any')
license=('BSD')

depends=('python-pyte' 'python-svgwrite' 'python-xlib')
makedepends=('git' 'python-setuptools')

provides=('termtosvg')
conflicts=('termtosvg')

source=('git+https://github.com/nbedos/termtosvg')

sha256sums=('SKIP')

pkgver() {
    cd termtosvg
    git describe --long --tags | sed -r 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

build() {
    cd termtosvg
    python setup.py build
}

package() {
    cd termtosvg
    python setup.py install --root="$pkgdir" --optimize=1
}
