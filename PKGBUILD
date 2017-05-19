# Maintainer: Pete Alexandrou (ozmartian) <pete@ozmartians.com>
pkgname=tvlinker
pkgver=3.9.0
pkgrel=2
pkgdesc="TV show link scraper + downloader for tv-release.pw incl. debrid and dl manager services"
arch=('any')
license=('GPL3')
url="http://tvlinker.ozmartians.com"
source=(https://github.com/ozmartian/${pkgname}/archive/${pkgver}.tar.gz)
depends=('python-pyqt5' 'python-beautifulsoup4' 'python-lxml' 'python-requests')
makedepends=('python-setuptools')
md5sums=('8e280f10512dd26e1579f39e53cb4191')

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
