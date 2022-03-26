# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-voila
_pkgname=${pkgname:7}
pkgver=0.3.4
pkgrel=1
pkgdesc="Voilà turns Jupyter notebooks into standalone web applications"
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(BSD)
makedepends=(python-build python-installer python-wheel python-setuptools python-jupyter_packaging)
depends=(
    python
    jupyter-server
    python-jupyterlab_server
    python-jupyter_client
    jupyter-nbclient
    jupyter-nbconvert
    python-websockets
    python-traitlets
)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('2e18062445a501fc24c4ae59bd53b2e81ba2d20a7d52516db5b13c3c934f22c4')
build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1
}
