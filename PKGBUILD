# Maintainer: Miika Launiainen <miika.launiainen@gmail.com>

pkgname=python-sauce-finder
_pkgname=sauce-finder
pkgver=v2.2.1
pkgrel=2
pkgdesc="Python script to find sauce for anime images."
arch=("any")
url="https://gitlab.com/miicat/$_pkgname"
license=("GPL3")
depends=("python-requests" "python-click" "python-validators")
makedepends=("git")
provides=("sauce-finder")
source=("${_pkgname}::git+https://gitlab.com/miicat/${_pkgname}")
md5sums=("SKIP")

build() {
	cd "${srcdir}/${_pkgname}"
	git checkout v2.2.1
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
