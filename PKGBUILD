# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=python-pdf2image
_name=pdf2image
pkgver=1.10.0
pkgrel=1
pkgdesc="Convert PDF to a PIL Image list"
url="https://github.com/Belval/${_name}"
arch=('any')
license=('MIT')
depends=('python' 'python-pillow' 'poppler')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Belval/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('849993e337c607692b4be07dbda7beb0f4d11eb6908ebfcbc5204fd00a4835796a09352b1e6cbdbb2958a1be9e32be410c8f3612459ee1d405100d5b18470145')

build() {
    cd "$srcdir/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_name}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
