# Maintainer: Nafis <mnabid.25@outlook.com>

pkgname=anitopy-git
_pkgname=${pkgname%-git}
pkgver=2.1.0
pkgrel=1
pkgdesc="Anime video filename parser in Python, based on Anitomy"
arch=('any')
url="https://github.com/igorcmoura/anitopy"
license=('MPL2')
depends=('python')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_pkgname}
	printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

package() {
	cd ${srcdir}/${_pkgname}
	python setup.py install --root=${pkgdir}
}
