# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=python-pdf2image
_name=pdf2image
pkgver=1.14.0
pkgrel=1
pkgdesc="Convert PDF to a PIL Image list"
url="https://github.com/Belval/${_name}"
arch=('any')
license=('MIT')
depends=('python' 'python-pillow' 'poppler')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Belval/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('acd3afe6068325bd5b6b8751cc5a7cf261333d53f198cca0ed2285a5cf5d31619a8620d1b1793e605ef0b490eb43b5390d406cbdcaa5b649bafe65f997d0a7fc')

build() {
    cd "$srcdir/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_name}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
