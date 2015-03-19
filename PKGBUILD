# Maintainer: Yardena Cohen <yardenack at gmail dot com>

gitname=pycollada
pkgname=${gitname}-git
pkgver=277.afd44fd
pkgrel=1
pkgdesc="Create, edit and load COLLADA documents in Python"
arch=('any')
url="https://github.com/${gitname}/${gitname}"
license=("BSD3")
depends=('python2-lxml' 'python2-numpy' 'python2-dateutil' 'python2-distribute')
makedepends=('git')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	 cd "${srcdir}/${gitname}"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

build() {
	 cd "${srcdir}/${gitname}"
	 python2 setup.py build
}

package() {
	 cd "${srcdir}/${gitname}"
	 python2 setup.py install --root="$pkgdir" --optimize=1
}
