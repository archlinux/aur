# Maintainer: nano thirteen <nano13@gmx.net>

_pkgname=('python-srtm')
pkgname=('python-srtm-git')
pkgver=141
pkgrel=1
pkgdesc='Python parser for the Shuttle Radar Topography Mission elevation data'
arch=('any')
license=('Apache')
url='https://github.com/tkrajina/srtm.py'
makedepends=('git' 'python-setuptools')
depends=('python-gpxpy')
source=(${_pkgname}::git+https://github.com/tkrajina/srtm.py.git)
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git rev-list --count HEAD
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

