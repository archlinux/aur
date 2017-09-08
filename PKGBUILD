
# Maintainer: kryptxy <kryptxy@protonmail.com>

pkgname=torrench
pkgver=1.0.51
pkgrel=1
pkgdesc="Command-line torrent search program"
arch=('any')
url="https://github.com/kryptxy/torrench"
license=('GPL')
depends=("python-tabulate" "python-setuptools" "python-beautifulsoup4" "python-lxml" "python-requests" 
"python-colorama")
provides=("torrench")
conflicts=("torrench")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py build	
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
