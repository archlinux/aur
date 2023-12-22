# Maintainer: Tomasz Zok <tomasz dot zok (at) gmail dot com>
pkgbase='python-rnapolis'
pkgname='python-rnapolis'
_module='RNApolis'
pkgver='0.3.2'
pkgrel=1
pkgdesc="A Python library containing RNA-related bioinformatics functions and classes"
url="https://github.com/tzok/rnapolis-py"
depends=('python' 'python-appdirs' 'python-graphviz' 'python-mmcif' 'python-numpy' 'python-ordered-set' 'python-orjson' 'python-pulp' 'python-requests' 'python-scipy' 'python-rna')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('0c813b28674d3d532a51c4f40c217e7e81b87a333b478bdbd5b82b7b39c469a6')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
