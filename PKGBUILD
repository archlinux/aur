# Maintainer: Wolfgang Mader <Wolfgang at Mad3r dot de> 

_name=pdftotext
_srcurl="https://files.pythonhosted.org"
pkgname=("python-${_name}")
pkgver=2.1.1
pkgrel=2
pkgdesc="Simple PDF text extraction"
arch=('any')
url="https://pypi.org/project/pdftotext"
license=('MIT')
depends=('poppler')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${_srcurl}/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        LICENSE)
md5sums=('be525c7a29ce6b1fad1bd8285ba906b2'
         '061d0915f2f14e32775f999a25bed0fe')
build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
    cp LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}"/ --optimize=1
}
