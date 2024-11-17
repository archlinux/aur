# Maintainer: sga013
pkgname='python-pdftitle'
_module='pdftitle'
_src_folder='pdftitle-0.16'
pkgver='0.16'
pkgrel=1
pkgdesc="pdftitle is a small utility to extract the title from a PDF file"
url="https://github.com/metebalci/pdftitle"
depends=('python' 'python-pdfminer')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('GPLv3')
arch=('any')
source=("https://files.pythonhosted.org/packages/b1/3b/7a71962cc31c515562256361cce465a349ce3531f6484bf30fef2baa9ca6/pdftitle-0.16.tar.gz")
sha256sums=('6b036efefc7045799e3c677a0d5c0694ce0d294e0feb6c219ba77dbd3f86e8f8')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}


