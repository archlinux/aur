# Maintainer: sga013
pkgname='python-pdftitle'
_module='pdftitle'
_src_folder='pdftitle-0.20'
pkgver='0.20'
pkgrel=1
pkgdesc="pdftitle is a small utility to extract the title from a PDF file"
url="https://github.com/metebalci/pdftitle"
depends=('python' 'python-pdfminer' 'python-dotenv')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('GPLv3')
arch=('any')
source=("https://files.pythonhosted.org/packages/2d/63/f297e39ab6636f0c0a389224483a2ae109ca49b038bc45b756bcd0d9ba26/pdftitle-0.20.tar.gz")
sha256sums=('2215dfdece85cec975f9c6febd855f97aa2157cfa6b490d0be1f02f4288e800e')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}


