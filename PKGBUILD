# Maintainer: Miika Launiainen <miika.launiainen@gmail.com>

pkgname=python-img-renamer
_pkgname=img-renamer
pkgver=v2.5.1
pkgrel=2
pkgdesc="Python script to rename images in numberic order."
arch=("any")
url="https://gitlab.com/miicat/$_pkgname"
license=("GPL3")
depends=("python-click")
makedepends=("git")
provides=("img-renamer")
source=("${_pkgname}::git+https://gitlab.com/miicat/${_pkgname}")
md5sums=("SKIP")

build() {
	cd "${srcdir}/${_pkgname}"
	git checkout v2.5.1
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
