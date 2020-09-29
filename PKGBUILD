# Maintainer: spider-mario <spidermario@free.fr>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Chris Elston chris.elston@blueyonder.co.uk
# Contributor: Artem Klevtsov a.a.klevtsov@gmail.com

pkgname=python-exiv2
_name=py3exiv2
pkgver=0.8.0
pkgrel=1
pkgdesc="A Python 3 binding to exiv2, the C++ library for manipulation of EXIF, IPTC and XMP image metadata."
url="https://launchpad.net/py3exiv2"
arch=('x86_64')
depends=('python' 'boost-libs' 'exiv2')
makedepends=('boost' 'python-setuptools')
license=('GPL3')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"{,.asc})
b2sums=('fd359262edad6e14fa11d3426f808b862b2fadf2e914d817e921ced7b41dd8e7eaf27057d958991cf824c7b709b02fdfd0bb9176fd891ac1bb4e01d515cf91fe'
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
