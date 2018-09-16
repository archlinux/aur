# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 

pkgname=python-paramz
pkgver=0.9.4
pkgrel=1
pkgdesc="Parameterization Framework for parameterized model creation and handling"
arch=("any")
license=("BSD")
url="https://github.com/sods/paramz"
depends=('python' 'python-numpy' 'python-scipy' 'python-six' 'python-decorator')
optdepends=('ipython' 'python-sphinx' 'python-ipykernel' 'python-ipywidgets' 'python-jupyter_client' 'jupyter-notebook')
makedepends=()
source=("https://github.com/sods/paramz/archive/v${pkgver}.tar.gz")
sha512sums=("5d06864671df11d2fdc5231f0aeedeedf473b8323f84af060217b72c59a9f6aadcbfb17ab3fa38561acac16b1703c392a52f0bfda404a11285e550114d195f42")

build() {
    cd "paramz-${pkgver}"
    python setup.py build
}

package() {
    cd "paramz-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-paramz/LICENSE"
}
