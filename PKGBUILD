# Maintainer: berocs <brandweineric at gmail dot com>
pkgname=python-simperium
_pkgname=Simperium3
pkgver=0.1.4
pkgrel=1
pkgdesc="Python 3 client for the Simperium synchronization platform"
arch=(any)
url="https://github.com/swalladge/simperium-python3"
license=("MIT")
depends=('python-requests')
makedepends=('python' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/13/d8/a330c0b50fd4d25eb34ac7bd5a846e1f0f5e1b6d4d56552e0f94efe61a4b/${_pkgname}-${pkgver}.tar.gz")
sha256sums=("647022946dcfe17d074c543c564c924a760276e269074b04df8a90b99bf5e100")

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
