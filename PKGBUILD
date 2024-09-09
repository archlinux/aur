# Maintainer: A.T.W.A. <arch.atwa@gmail.com>
# Contributor: berocs <brandweineric at gmail dot com>

pkgname=python-simperium
pkgver=0.1.5
pkgrel=1
pkgdesc="Simperium client library for Python"
arch=('any')
url="https://git.sr.ht/~swalladge/python-simperium3"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/dd/e1/9df1f37d87085ad4451b873e3a066f2164a8cae107a5dd0ec1e1d384d0c8/Simperium3-${pkgver}.tar.gz")
sha256sums=('78b8186be18869ad5fd85e83dd50ec2b94ad4f473d0f6d9f9de398a10114d137')

build() {
    cd "Simperium3-${pkgver}"
    python setup.py build
}

package() {
    cd "Simperium3-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
