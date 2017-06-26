# Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=tvlinker
pkgver=4.0.0
pkgrel=3
pkgdesc="TV show link scraper + downloader for Scene-RLS.com w/ debrid link unrestricting and support for a number of download managers across all platforms"
arch=('any')
license=('GPL3')
url="http://tvlinker.ozmartians.com"
source=(https://github.com/ozmartian/${pkgname}/archive/${pkgver}.tar.gz)
depends=('python-pyqt5' 'python-beautifulsoup4' 'python-lxml' 'python-requests' 'python-cfscrape' 'nodejs')
makedepends=('python-setuptools')
md5sums=('812e1d6b0e4057a6b6f5e80f90d4c044')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i "s/pypi/arch/" "${pkgname}/__init__.py"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
