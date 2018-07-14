# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 

pkgname=python-paramz
pkgver=0.9.2
pkgrel=1
pkgdesc="Parameterization Framework for parameterized model creation and handling"
arch=("any")
license=("BSD")
url="https://github.com/sods/paramz"
depends=('python' 'python-numpy' 'python-scipy' 'python-six' 'python-decorator')
optdepends=('ipython' 'python-sphinx' 'python-ipykernel' 'python-ipywidgets' 'python-jupyter_client' 'jupyter-notebook')
makedepends=()
source=("https://github.com/sods/paramz/archive/v${pkgver}.tar.gz")
sha512sums=("cc63e312dd927bab4f82257ada3a74e5ebd7b349ef765f06171cfa2b40876325c20fb28d268e6824adc1dbe350575e77994292dcc74446c5c16ab53c201b6542")

build() {
    cd "paramz-${pkgver}"
    python setup.py build
}

package() {
    cd "paramz-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-paramz/LICENSE"
}
