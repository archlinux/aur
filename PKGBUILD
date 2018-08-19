# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=yq
pkgver=2.7.0
pkgrel=2
pkgdesc="Command-line YAML processor - jq wrapper for YAML documents"
url="https://github.com/kislyuk/yq"
depends=('python' 'python-yaml' 'jq' 'python-xmltodict>=0.11.0' 'python-toml>=0.9.4')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/y/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f62de3b596056bfb26517b88c1c1775b8364cdae963e36b29ba49623e689a8db')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
