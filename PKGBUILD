# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=python-pdf2image
_name=pdf2image
pkgver=1.16.0
pkgrel=1
pkgdesc="Python wrapper around the pdftoppm and pdftocairo command line tools to convert PDF to a PIL Image list"
url="https://github.com/Belval/${_name}"
arch=('any')
license=('MIT')
depends=('python' 'python-pillow' 'poppler')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Belval/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('fa5f5952620fc3de128c2d5fe11b7b0c5d3fce87e6eb65ffd898d374b7d6b9b445a81f686bce90b7d91e2532de6b7dfb8bc1e153840f04502bbe122646b4b3a8')

build() {
    cd "$srcdir/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_name}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
