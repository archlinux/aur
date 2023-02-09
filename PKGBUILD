# Maintainer: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz(rot13)>
# Contributor: acxz <akashpatel2008@yahoo.com>

pkgname=python-flake8-quotes
_pkgname=flake8-quotes
pkgver=3.3.2
pkgrel=2
pkgdesc="Flake8 lint for quotes"
arch=('any')
url="https://github.com/zheller/${_pkgname}"
license=('MIT')
depends=('flake8')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zheller/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('884d027b6126b6216bdb9fa95a9841c4f07f600569a4a41f3d0cdbf71afe6bcb')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
