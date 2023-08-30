# Maintainer: Sergey Salnikov <salsergey at gmail dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Chris Elston chris.elston@blueyonder.co.uk
# Contributor: Artem Klevtsov a.a.klevtsov@gmail.com

pkgname=python-exiv2
_name=py3exiv2
pkgver=0.12.0
pkgrel=1
pkgdesc="A Python 3 binding to exiv2, the C++ library for manipulation of EXIF, IPTC and XMP image metadata."
url="https://launchpad.net/py3exiv2"
arch=('x86_64')
depends=('python' 'boost-libs' 'exiv2')
makedepends=('boost' 'python-setuptools')
license=('GPL3')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('f810a9b7ff1e0620ad51b2a0a99c65ac22c8cdd3c56073779845dc91f2146857ec86d1fae8df2768affcc3753fbb4338a817d865b813d9c99321bc7b7a3e8ab5')
validpgpkeys=('857162EA24FA8D09C363DD3C068346EEA7A91F52') # Vincent Vande Vyvre (iturikey) <vincent.vandevyvre@oqapy.eu>

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
