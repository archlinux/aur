# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=python-drawtetrado
_name=${pkgname#python-}
pkgver=1.2
pkgrel=1
pkgdesc="Visualize quadruplexes and G4-helices in DNA and RNA structures"
arch=(any)
url=https://github.com/michal-zurkowski/drawtetrado
license=(MIT)
depends=(python python-cairo python-svgwrite)
makedepends=(python-setuptools cython 'gcc>8')
optdepends=('python-eltetrado: the application producing inputs to python-drawtetrado')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('fcde0b0a9519b0f1f278e0a94a43899617f286144117d44d22a3479cfc20ed8d')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
