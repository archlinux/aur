# Maintainer: Adrian Room <ingolemo@gmail.com>

_name=lute
pkgname=${_name}-git
pkgver=0.1.0.88.gd93dfa5
pkgrel=1
pkgdesc='A rom library management system for organised gamers'
arch=('x86_64')
url='https://github.com/ingolemo/lute'
license=('GPL3')
depends=('python' 'python-click' 'python-parsimonious' 'python-requests' 'python-toml')
source=('git://github.com/ingolemo/lute.git')
md5sums=('SKIP')

pkgver() {
	cd "${_name}"
	git describe --tags | sed 's/-/./g'
}

build() {
	cd "${srcdir}/${_name}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
