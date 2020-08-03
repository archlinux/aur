# Maintainer: spider-mario <spidermario@free.fr>
# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Chris Elston chris.elston@blueyonder.co.uk
# Contributor: Artem Klevtsov a.a.klevtsov@gmail.com

pkgname=python-exiv2
_name=py3exiv2
pkgver=0.7.2
pkgrel=1
pkgdesc="A Python 3 binding to exiv2, the C++ library for manipulation of EXIF, IPTC and XMP image metadata."
url="https://launchpad.net/py3exiv2"
arch=('x86_64')
depends=('python' 'boost-libs' 'exiv2')
makedepends=('boost')
license=('GPL3')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"{,.asc})
b2sums=('45ad319735d8fbfc9beb2d5a3af09eeb5e2c4662ffa7081a856e2cb5414dd807d3bb543d901dab2b88369788039a1886658324ea20ed50304e4654135b4b3855'
        'SKIP')
validpgpkeys=('857162EA24FA8D09C363DD3C068346EEA7A91F52') # Vincent Vande Vyvre (iturikey) <vincent.vandevyvre@oqapy.eu>

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
