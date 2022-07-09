pkgname=csvs-to-sqlite
_pkgname=csvs_to_sqlite
pkgver=1.3
pkgrel=1
pkgdesc="Convert CSV files into a SQLite database"
arch=("any")
url="https://github.com/simonw/csvs-to-sqlite"
license=("Apache")
depends=("python-click" "python-dateparser" "python-pandas" "python-py-lru-cache" "python-six")
makedepends=("python-setuptools")
conflicts=("csvs-to-sqlite")
source=("https://pypi.io/packages/source/c/${pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=("638623ff5462e60123da07860a096f9cff0d7aa8f036e68cc98001e006adea59")

build() {
    cd "${_pkgname}-${pkgver}"
    sed -i 's/click~=7.0/click>=7.0/' setup.py
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1
}
