# Maintainer: Ainola

pkgname=python2-image-git
pkgver=r152.6995eb0
pkgrel=3
pkgdesc="Django application that provides editing for images and videos."
arch=('any')
url="https://github.com/francescortiz/image"
license=('BSD')
makedepends=('python2-setuptools')
depends=('python2' 'python2-pillow' 'python2-requests' 'python2-django')
provides=('python2-image')
source=("git+https://github.com/francescortiz/image.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/image"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/image"
    python2 setup.py build
}

package() {
    cd "$srcdir/image"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
