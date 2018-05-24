# Maintainer: Niklas <dev@n1klas.net>

pkgname=python-sseclient
_name=sseclient
pkgver=0.0.19
pkgrel=1
pkgdesc="Client library for reading Server Sent Event streams"
arch=('any')
url="https://github.com/btubbs/sseclient"
license=('MIT')
depends=('python-requests>=2.0.0' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('456ebf0e09398e81c9ee15aa5eb7d6d7')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
