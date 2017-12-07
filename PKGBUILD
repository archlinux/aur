# Maintainer: Ainola

pkgname=python-image-git
pkgver=r152.6995eb0
pkgrel=3
pkgdesc="Django application that provides editing for images and videos."
arch=('any')
url="https://github.com/francescortiz/image"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-pillow' 'python-requests' 'python-django')
provides=('python-image')
source=("git+https://github.com/francescortiz/image.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/image"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/image"
    python setup.py build
}

package() {
    cd "$srcdir/image"
    python setup.py install --root="$pkgdir/" --optimize=1
}
