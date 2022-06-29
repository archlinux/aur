# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Daniel Peukert <daniel@peukert.cc>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Kevin Houdebert <kevin@qwazerty.eu>
# Contributor: Erhan SAHIN <erhan@ssahin.net>

pkgname='python2-monotonic'
_name="${pkgname#python2-}"
pkgver=1.6
pkgrel=2
pkgdesc='An implementation of time.monotonic() (legacy Python 2 version)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools')
_tarname="${_name}-${pkgver}"
source=("${_tarname}.tar.gz::https://github.com/atdt/${_name}/archive/${pkgver}.tar.gz")
sha256sums=('9609c249aed584fd714811014870650d08d6f6414402b5a190663c49bf83b221')

build() {
    cd "${_tarname}"
	python2 setup.py build
}

package() {
    cd "${_tarname}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
