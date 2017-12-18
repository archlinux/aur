pkgname='python-pytablereader'
_module='pytablereader'
pkgver='0.15.0'
pkgrel=1
pkgdesc="A Python library to load structured table data from files/strings/URL with various data format: CSV/Excel/Google-Sheets/HTML/JSON/LTSV/Markdown/SQLite/TSV."
url="https://github.com/thombashi/pytablereader"
depends=('python' 'python-xlrd>=1.0.0' 'python-path.py>=10.3.1' 'python-markdown2>=2.3.4' 'python-beautifulsoup4>=4.6.0' 'python-dataproperty>=0.29.1' 'python-enum-compat' 'python-jsonschema>=2.6.0' 'python-logbook' 'python-mbstrdecoder' 'python-pathvalidate>=0.16.2' 'python-pyparsing>=2.2.0' 'python-requests>=2.18.4' 'python-six' 'python-typepy>=0.0.20')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/thombashi/pytablereader/archive/v${pkgver}.tar.gz")
md5sums=('b413490da71dd99e5ab150578c1c7ada')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
