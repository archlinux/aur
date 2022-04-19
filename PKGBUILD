# Maintainer: Christoph Brill <egore911@gmail.com>
pkgname=python-face-alignment
_pkgname=face_alignment
pkgver=1.3.5
pkgrel=1
pkgdesc="Detect facial landmarks from Python using an accurate face alignment network"
arch=('any')
url="https://github.com/1adrianb/face-alignment"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/${_pkgname::1}/${pkgname#python-}/${_pkgname}-$pkgver.tar.gz)
sha256sums=('20e940a7c769c7c4cdfd1d4ef1212ec68468721b8df0c17bf93b29b37c61a071')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
