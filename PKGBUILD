# Maintainer: Wolfgang Mader <Wolfgang at Mad3r dot de> 

_name=pdftotext
_srcurl="https://files.pythonhosted.org"
pkgname=("python-${_name}")
pkgver=2.0.2
pkgrel=2
pkgdesc="Simple PDF text extraction"
arch=('any')
url="https://pypi.org/project/pdftotext"
license=('MIT')
depends=('poppler')
source=("${pkgname}-${pkgver}.tar.gz::${_srcurl}/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        LICENSE)
md5sums=('2658a8827afc08e44eba314759ac2d35'
         '061d0915f2f14e32775f999a25bed0fe')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
    cp LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="{$pkgdir}/" --optimize=1
}
