# Maintainer: sga013
pkgname='python-pdf2bib'
_module='pdf2bib'
_src_folder='pdf2bib-1.2'
pkgver='1.2'
pkgrel=1
pkgdesc="A python library/command-line tool to quickly and automatically generate BibTeX data starting from the pdf file of a scientific publication."
url="https://github.com/MicheleCotrufo/pdf2bib"
depends=('python' 'python-bibtexparser' 'python-pyperclip' 'python-unidecode' 'python-pdf2doi')
makedepends=('python-build' 'python-installer' 'python-wheel' 'curl')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/86/58/2ed869b6aab7c8f555130bafbabe50562f0c11aa486a35d608c7baef0910/pdf2bib-1.2.tar.gz")
sha256sums=('3fd4d9e99585a3ba2115892d3e2fac132151f7bd9c7e1f2ffae5c54ec22c66cc')

build() {
    cd "${srcdir}/${_src_folder}"
    curl https://raw.githubusercontent.com/MicheleCotrufo/pdf2bib/refs/heads/master/requirements.txt > requirements.txt
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
