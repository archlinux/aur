# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=python-pdf2image
_name=pdf2image
pkgver=1.16.3
pkgrel=1
pkgdesc="Python wrapper around the pdftoppm and pdftocairo command line tools to convert PDF to a PIL Image list"
url="https://github.com/Belval/${_name}"
arch=('any')
license=('MIT')
depends=('python' 'python-pillow' 'poppler')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Belval/${_name}/archive/v.${pkgver}.tar.gz")
sha512sums=('8c724307fcb7b7d1e577ac5ed76a54393a283eb3e7378762506862123af25f0ed9fda7f0309140456aab493bd75405c54195579d1d2bbaec4502861f2731e506')

build() {
    cd "$srcdir/${_name}-v.${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_name}-v.${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
