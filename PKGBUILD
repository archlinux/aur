# Maintainer: Popolon <popolon@popolon.org>

pkgbase='python-sphinxcontrib-hdl-diagrams'
pkgname=('python-sphinxcontrib-hdl-diagrams')
_module='sphinxcontrib-hdl-diagrams'
pkgver='0.0.post160'
pkgrel=1
pkgdesc="Generate diagrams from HDL in Sphinx."
url="https://github.com/SymbiFlow/sphinxcontrib-hdl-diagrams"
depends=('python-sphinx' 'yosys' 'python-nmigen' 'python-amaranth-git')
#optional=('netlistsvg')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('7c05a7a0532247d06a21a121919ec902e9e7b8109b0da875c89311603ef4099d')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
