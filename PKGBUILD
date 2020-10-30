pkgname=picopt
pkgver=2.2.1
pkgrel=1
pkgdesc="A multi format lossless image optimizer that uses external tools"
url="https://github.com/ajslater/picopt"
depends=('python' 'python-pillow' 'python-argparse' 'python-dateutil' 'python-rarfile')
makedepends=('python-setuptools')
optdepends=(gifsicle mozjpeg optipng jpegrescan jpegtran advpng pngout optipng)
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('35a246798af996466d2dad4df24b2e4461f01a9983c6a684c25542dbd26ece48')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
