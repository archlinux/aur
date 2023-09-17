# Maintainer: Christoph Brill <egore911@gmail.com>
pkgname=python-face-alignment
_pkgname=face_alignment
pkgver=1.4.1
pkgrel=1
pkgdesc="Detect facial landmarks from Python using an accurate face alignment network"
arch=('any')
url="https://github.com/1adrianb/face-alignment"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/${_pkgname::1}/${pkgname#python-}/${_pkgname}-$pkgver.tar.gz)
sha256sums=('90e47b827a7913de19de99d0df0bf0ab539fb29ed674aeaec0ac27666cafbed9')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
