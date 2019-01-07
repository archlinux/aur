# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=yq
pkgver=2.7.1
pkgrel=1
pkgdesc="Command-line YAML processor - jq wrapper for YAML documents"
url="https://github.com/kislyuk/yq"
depends=('python' 'python-yaml' 'jq' 'python-xmltodict>=0.11.0' 'python-toml>=0.9.4')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/y/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('001b746228f15da5109a3677eccf3f6eeeca88fd5b3ca408d1a8a1fee0e220b0')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
