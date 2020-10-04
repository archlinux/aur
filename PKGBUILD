# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-mouseinfo
_name=MouseInfo
pkgver=0.1.3
pkgrel=1
pkgdesc="Display XY position and RGB color information for the pixel currently under the mouse."
arch=('any')
url="https://github.com/asweigart/mouseinfo"
license=('GPL3')
depends=('python-xlib' 'python-pyperclip' 'python-pillow' 'tk')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2c62fb8885062b8e520a3cce0a297c657adcc08c60952eb05bc8256ef6f7f6e7')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
