# Maintainer: Tomasz Zok <tomasz dot zok (at) gmail dot com>
pkgbase='python-rnapolis'
pkgname='python-rnapolis'
_module='RNApolis'
pkgver='0.3.1'
pkgrel=1
pkgdesc="A Python library containing RNA-related bioinformatics functions and classes"
url="https://github.com/tzok/rnapolis-py"
depends=('python' 'python-appdirs' 'python-graphviz' 'python-mmcif' 'python-numpy' 'python-ordered-set' 'python-orjson' 'python-pulp' 'python-requests' 'python-scipy' 'python-rna')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('e3cb0da5f780b967dc4c8c248c1a185f42735a4a4710612a2fcfa7fa445fe68b')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
