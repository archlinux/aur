# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributor: Julian Daube <joposter at gmail dot com>

pkgname="python-pybars3-git"
pkgver=0.9.7.r1.g2edd2fa
pkgrel=2
pkgurl="https://launchpad.net/pybars"

arch=("any")
provides=("python-pybars3")
depends=('python-pymeta3')
makedepends=("python-setuptools")

source=("$pkgname::git+https://github.com/wbond/pybars3.git")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1
}
