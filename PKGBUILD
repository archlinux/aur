# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=python-drawtetrado
_name=${pkgname#python-}
pkgver=1.5.0
pkgrel=1
pkgdesc="Visualize quadruplexes and G4-helices in DNA and RNA structures"
arch=(any)
url=https://github.com/michal-zurkowski/drawtetrado
license=(MIT)
depends=(python python-cairo python-svgwrite python-orjson)
makedepends=(python-setuptools cython 'gcc>8')
optdepends=('python-eltetrado: the application producing inputs to python-drawtetrado')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('72b86f4908a01c8f98fdf26328d18aeb2cb62277066c9aa401dd86005f15323c')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
