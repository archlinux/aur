pkgname=python-svgwrite-git
pkgver=1.1.12.r1.g5ce5ed5
pkgrel=1

pkgdesc='write svg files'
url='https://github.com/mozman/svgwrite'
arch=('any')
license=('MIT')

depends=('python')
makedepends=('git' 'python-setuptools')

provides=('python-svgwrite')
conflicts=('python-svgwrite')

source=('git+https://github.com/mozman/svgwrite')

sha256sums=('SKIP')

pkgver() {
    cd svgwrite
    git describe --long --tags | sed -r 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

build() {
    cd svgwrite
    python setup.py build
}

package() {
    cd svgwrite
    python setup.py install --root="$pkgdir" --optimize=1
}
