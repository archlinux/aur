_name="rauth"
_module="${_name}"

pkgname="python-${_module}"
pkgver="0.7.3"
pkgrel="3"
pkgdesc="A Python library for OAuth 1.0/a, 2.0, and Ofly"
arch=("any")
url="https://github.com/maxcountryman/rauth"
license=("MIT")
depends=("python-requests>=1.2.3")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('524cdbc1c28560eacfc9a9d40c59525eb8d00fdf07fbad86107ea24411477b0a')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

