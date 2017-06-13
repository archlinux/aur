# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=yq
pkgver='2.1.1'
pkgrel=1
pkgdesc="Command-line YAML processor - jq wrapper for YAML documents"
url="https://github.com/kislyuk/yq"
depends=('python' 'python-yaml' 'jq')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/y/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ed02a0ade44d97413a3ce105ffd031f44a47c49d493c1ccff999cc635d5df93c')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
