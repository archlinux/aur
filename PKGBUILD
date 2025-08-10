pkgname='python-pukiwikidumper'
_module='PukiWikiDumper'
_src_folder='pukiwikidumper-0.0.19'
pkgver='0.0.19'
pkgrel=1
pkgdesc="A tool for archiving PukiWiki"
url="None"
depends=('python' 'python-requests' 'python-beautifulsoup4' 'python-internetarchive' 'python-rich' 'python-slugify' 'python-chardet' '7zip')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
license=('GPLv3')
arch=('any')
source=("https://files.pythonhosted.org/packages/c6/46/ff4fd78e11c8591df4e1cd53ff9c81be4b3da018361fbd5d5dcb7a666ef7/pukiwikidumper-0.0.19.tar.gz")
sha256sums=('6ed9e0370aa3cc7d205d5378d614fb05a8aba51be6fc8292cbd466c428928fd1')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
