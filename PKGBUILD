# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 

pkgname=python-paramz
pkgver=0.9.6
pkgrel=1
pkgdesc="Parameterization Framework for parameterized model creation and handling"
arch=("any")
license=("BSD")
url="https://github.com/sods/paramz"
depends=('python' 'python-numpy' 'python-scipy' 'python-six' 'python-decorator' 'python-climin-git')
optdepends=('ipython' 'python-sphinx' 'python-ipykernel' 'python-ipywidgets' 'python-jupyter_client' 'jupyter-notebook')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://github.com/sods/paramz/archive/v${pkgver}.tar.gz")
sha256sums=('dc2f954ceceb9c67703e613e1c3dff63ecffcfb036bfc770a885ecce4d5b3083')

build() {
    cd "paramz-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "paramz-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-paramz/LICENSE"
}
