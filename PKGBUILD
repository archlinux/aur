_name="rauth"
_module="${_name}"

pkgname=("python-${_module}")
pkgver="0.7.3"
pkgrel="2"
pkgdesc="A Python library for OAuth 1.0/a, 2.0, and Ofly"
arch=("any")
url="https://github.com/maxcountryman/rauth"
license=("MIT")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('524cdbc1c28560eacfc9a9d40c59525eb8d00fdf07fbad86107ea24411477b0a')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package_python-rauth() {
    depends=("python-requests>=1.2.3")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

