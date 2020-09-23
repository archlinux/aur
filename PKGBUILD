# Maintainer: bajaco <admin@agyx.org>
pkgname=hotbox-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Python3-based CLI hotkey configurator for Openbox"
arch=('any')
url="https://github.com/bajaco/hotbox"
license=('MIT')
depends=(python)
makedepends=('python-setuptools' 'git')
source=("git://github.com/bajaco/hotbox.git")
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/hotbox
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
	cd "${srcdir}/hotbox"
	python setup.py build
}

package() {
	cd "${srcdir}/hotbox"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

}
