# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: arno <apithon.AT.free.DOT.fr>
# Contributor: Pierre Bourdon <delroth@gmail.com>
# Contributor: ianux <ianux AT free DOT fr>

pkgname=python-hachoir
pkgver=3.1.2
pkgrel=1
pkgdesc="A Python library to view and edit a binary stream field by field"
arch=('any')
url='https://github.com/vstinner/hachoir'
license=('GPL')
depends=('python>=3.6' 'python-urwid' 'python-wxpython')
makedepends=('python-setuptools')
provides=('hachoir')
conflicts=('hachoir')
replaces=('hachoir-core')
source=("https://files.pythonhosted.org/packages/source/h/hachoir/hachoir-$pkgver.tar.gz")
sha256sums=('bc1259b1e2970532b2dbd99139cb0de59d9bb8904eb1489c3e8a82c979c98f23')

build() {
	cd "hachoir-$pkgver"
	python setup.py build
}

package() {
	cd "hachoir-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
