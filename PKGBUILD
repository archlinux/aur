pkgname=picopt
pkgver=2.2.0
pkgrel=1
pkgdesc="A multi format lossless image optimizer that uses external tools"
url="https://github.com/ajslater/picopt"
depends=('python' 'python-pillow' 'python-argparse' 'python-dateutil' 'python-rarfile')
makedepends=('python-setuptools')
optdepends=(gifsicle mozjpeg optipng jpegrescan jpegtran advpng pngout optipng)
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('7d6d3cadbe141527f720841bb898f08c8bf15bef05317e82d4c16cc71692b169')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
