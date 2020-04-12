# Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname="sauce-finder-git"
_pkgname="sauce-finder"
pkgver=v1.0.0.r2.g9907d1f
pkgrel=1
pkgdesc="Python script to find sauce for anime images"
arch=('any')
url="https://gitlab.com/miicat/$_pkgname"
license=('gpl3')
depends=('python-requests')
provides=('sauce-finder')
source=("${_pkgname}::git+https://gitlab.com/miicat/${_pkgname}")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${srcdir}/${_pkgname}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
