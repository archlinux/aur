# Maintainer: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz(rot13)>
# Contributor: acxz <akashpatel2008@yahoo.com>

pkgname=python-flake8-quotes
_pkgname=flake8-quotes
pkgver=3.3.1
pkgrel=2
pkgdesc="Flake8 lint for quotes"
arch=('any')
url="https://github.com/zheller/${_pkgname}"
license=('MIT')
depends=('flake8')
source=("https://github.com/zheller/${_pkgname}/archive/$pkgver.tar.gz")
sha256sums=('64167f280031a5cce5499487a94ff023a058a70a7d9aba31d27f58e91b6703b8')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
