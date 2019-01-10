# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=yq
pkgver=2.7.2
pkgrel=1
pkgdesc="Command-line YAML processor - jq wrapper for YAML documents"
url="https://github.com/kislyuk/yq"
depends=('python' 'python-yaml' 'jq' 'python-xmltodict>=0.11.0' 'python-toml>=0.9.4')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/y/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f7dafd1e53d1f806ffe11de6da814e231d866595e2faae0dfc38135b8ee79bbb')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
