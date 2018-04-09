 # Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=tvlinker
pkgver=4.0.5
_pkgver=master
pkgrel=8
pkgdesc="TV show link scraper + downloader for Scene-RLS.com w/ debrid link unrestricting and support for a number of download managers across all platforms"
arch=('any')
license=('GPL3')
url="https://tvlinker.ozmartians.com"
source=(https://github.com/ozmartian/${pkgname}/archive/${_pkgver}.tar.gz)
depends=('python-pyqt5' 'python-beautifulsoup4' 'python-lxml' 'python-requests', 'nodejs')
makedepends=('python-setuptools')
optdepends=('python-pysocks' 'aria2' 'pyload' 'persepolis')
md5sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}-${_pkgver}"
    sed -i "s/pypi/arch/" "${pkgname}/__init__.py"
}

build() {
    cd "${srcdir}/${pkgname}-${_pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${_pkgver}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
