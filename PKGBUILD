# Maintainer: Popolon <popolon@popolon.org>

pkgbase='python-sphinxcontrib-hdl-diagrams'
pkgname=('python-sphinxcontrib-hdl-diagrams')
_module='sphinxcontrib-hdl-diagrams'
pkgver='0.0.post131'
pkgrel=2
pkgdesc="Generate diagrams from HDL in Sphinx."
url="https://github.com/SymbiFlow/sphinxcontrib-hdl-diagrams"
depends=('python-sphinx' 'yosys')
#optional=('netlistsvg')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('f05f467d91c90b879090ef04f80481cca171d7a8cc909bfa6eef3ed2d6687cf1')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
