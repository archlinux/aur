# Maintainer: sga013
pkgname='python-pdf2doi'
_module='pdf2doi'
_src_folder='pdf2doi-1.7'
pkgver='1.7'
pkgrel=1
pkgdesc="A  python library/command-line tool to extract the DOI or other identifiers of a scientific paper from a pdf file."
url="https://github.com/MicheleCotrufo/pdf2doi"
depends=('python' 'python-google' 'python-requests' 'python-pypdf2' 'python-pdftitle' 'python-feedparser' 'python-pyperclip' 'python-easygui' 'python-pdfminer' 'python-pymupdf' 'python-pypdf')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/c5/6f/867dd20a2467f5f7a17ef10b514219fcc7e6b2ae872e1f792ca22f2fb1e1/pdf2doi-1.7.tar.gz")
sha256sums=('54d257bce59397ef577c588c8bc8a35930ffd1e7d05e7c3c454423bf5679bf2e')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

