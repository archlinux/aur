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
sha512sums=('e016b5127e0722fc6e1d072ecd53f2517c673212b437afb3be270f73786a7f3d1e584626cf89727171c67f6aa403e919ab61c41f5495bcab9713c38b71814aaf')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
