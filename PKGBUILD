# Maintainer: Christoph Brill <egore911@gmail.com>
pkgname=python-face-alignment
_pkgname=face_alignment
pkgver=1.0.0
pkgrel=1
pkgdesc="Detect facial landmarks from Python using an accurate face alignment network"
arch=('any')
url="https://github.com/1adrianb/face-alignment"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/${pkgname::1}/${pkgname#python-}/${_pkgname}-$pkgver.tar.gz)
sha256sums=('558c2b688c6ab40580da2e55f7d17911acd787aa6af3fafe5f94549a9600e02e')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
