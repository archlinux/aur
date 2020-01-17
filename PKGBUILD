pkgname=picopt
pkgver=2.1.0
pkgrel=1
pkgdesc="A multi format lossless image optimizer that uses external tools"
url="https://github.com/ajslater/picopt"
depends=('python' 'python-pillow' 'python-argparse' 'python-dateutil' 'python-rarfile')
makedepends=('python-setuptools')
optdepends=(gifsicle mozjpeg optipng jpegrescan jpegtran advpng pngout optipng)
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('5afc4bd6d3158f616f79876b12009827e8f78f220d998a0653e704f5b85a6492')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
