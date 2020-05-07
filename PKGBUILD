# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=python-pdf2image
_name=pdf2image
pkgver=1.13.1
pkgrel=1
pkgdesc="Convert PDF to a PIL Image list"
url="https://github.com/Belval/${_name}"
arch=('any')
license=('MIT')
depends=('python' 'python-pillow' 'poppler')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Belval/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('fae60e100b9a041a08f66b46ee650dbe0c81e73857bf97c8ab9b10c39cc0463d1757d074ad350d70366adfbdfd11ed7b7f826c6d23bb635311eb4a5f60aa1906')

build() {
    cd "$srcdir/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_name}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
