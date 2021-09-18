# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Chris Elston chris.elston@blueyonder.co.uk
# Contributor: Artem Klevtsov a.a.klevtsov@gmail.com

pkgname=python-exiv2
_name=py3exiv2
pkgver=0.9.3
pkgrel=1
pkgdesc="A Python 3 binding to exiv2, the C++ library for manipulation of EXIF, IPTC and XMP image metadata."
url="https://launchpad.net/py3exiv2"
arch=('x86_64')
depends=('python' 'boost-libs' 'exiv2')
makedepends=('boost' 'python-setuptools')
license=('GPL3')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"{,.asc})
b2sums=('9beb1c3d5f2f6c8ad5ab388274a9a695250dc75eeeb7868593f614a5074faabceb07c341be5e75559131f071f660b679ff5f720dec415980a0bb94b701e68d9c'
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
