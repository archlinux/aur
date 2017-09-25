# Maintainer: nano thirteen <nano13@gmx.net>

_pkgname=('python-gpsd')
pkgname=('python-gpsd-git')
pkgver=0.2.0.r9.gf166c78
pkgrel=1
pkgdesc='A library for polling gpsd in Python3'
arch=('any')
license=('unknown')
url='https://github.com/MartijnBraam/gpsd-py3'
makedepends=('git' 'python-setuptools')
depends=('gpsd')
source=(${_pkgname}::git+https://github.com/MartijnBraam/gpsd-py3.git)
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    
    msg 'Building ...'
    python ./setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    
    python ./setup.py install --skip-build --root="$pkgdir/"
}
