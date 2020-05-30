# Maintainer: acxz <akashpatel2008@yahoo.com>

pkgname="python-flake8-class-newline"
_pkgname="flake8-class-newline"
pkgver=1.6.0
pkgrel=1
pkgdesc="Flake lint for newline after class definitions."
arch=('any')
url="https://github.com/AlexanderVanEck/${_pkgname}"
license=('MIT')
depends=('flake8')
source=("https://github.com/AlexanderVanEck/flake8-class-newline/archive/$pkgver.tar.gz")
md5sums=('abf91dad16b08ec69b13b12886550774')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
