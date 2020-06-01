# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributor: Julian Daube <joposter at gmail dot com>

pkgname="python-pymeta3-git"
pkgdesc="Pattern-matching language based on OMeta for Python 3 and 2"
pkgver=0.5.1.r0.g61be6c2
pkgrel=1
url="https://github.com/wbond/pymeta3"

license=("MIT")
arch=("any")
provides=("python-pymeta3")

depends=("python")
makedepends=("python-setuptools")

source=("$pkgname::git+https://github.com/wbond/pymeta3.git")
md5sums=("SKIP")

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1

	# install license
	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/python-pymeta3/LICENSE
}
