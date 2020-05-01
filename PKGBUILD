# Maintainer: Yardena Cohen <yardenack at gmail dot com>

gitname=pycollada
pkgname=${gitname}-git
pkgver=357.55d55dc
pkgrel=1
pkgdesc="Create, edit and load COLLADA documents in Python"
arch=('any')
url="https://github.com/${gitname}/${gitname}"
license=("BSD3")
depends=(python-lxml python-numpy python-dateutil python-distribute)
makedepends=(git)
provides=(pycollada)
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	 cd "${srcdir}/${gitname}"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

build() {
	 cd "${srcdir}/${gitname}"
	 python setup.py build
}

package() {
	 cd "${srcdir}/${gitname}"
	 python setup.py install --root="$pkgdir" --optimize=1
}
