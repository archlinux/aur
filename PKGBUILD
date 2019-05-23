# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 

pkgname=python-paramz
pkgver=0.9.5
pkgrel=1
pkgdesc="Parameterization Framework for parameterized model creation and handling"
arch=("any")
license=("BSD")
url="https://github.com/sods/paramz"
depends=('python' 'python-numpy' 'python-scipy' 'python-six' 'python-decorator')
optdepends=('ipython' 'python-sphinx' 'python-ipykernel' 'python-ipywidgets' 'python-jupyter_client' 'jupyter-notebook')
makedepends=()
source=("https://github.com/sods/paramz/archive/v${pkgver}.tar.gz")
sha256sums=("817af2566ae4dfdfb7fde54c69ebb52070da2077b25315fc8433bfd9e2e520dd")

build() {
    cd "paramz-${pkgver}"
    python setup.py build
}

package() {
    cd "paramz-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-paramz/LICENSE"
}
