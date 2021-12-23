# Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=tvlinker
pkgver=4.5.0
pkgrel=13
pkgdesc="TV show link scraper + downloader for Scene-RLS.com w/ debrid link unrestricting and support for a number of download managers across all platforms + ShadowSocks & v2ray local proxies."
arch=('any')
license=('GPL3')
url="https://tvlinker.ozmartians.com"
# source=(https://github.com/ozmartian/${pkgname}/archive/${_branch}.tar.gz)
# source=(git+https://github.com/ozmartian/tvlinker.git)
source=(https://github.com/ozmartian/tvlinker/archive/refs/heads/master.tar.gz)
depends=('python-beautifulsoup4' 'python-cloudscraper' 'python-js2py' 'python-lxml' 'python-pyjsparser' 'python-pyqt5' 'python-pytz' 'python-requests' 'python-setuptools' 'python-tzlocal')
makedepends=('python-setuptools')
optdepends=('aria2' 'persepolis' 'pyload-ng' 'python-pysocks')
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}-master"
    sed -i "s/pypi/arch/" "${pkgname}/__init__.py"
}

build() {
    cd "${srcdir}/${pkgname}-master"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-master"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
