# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>

pkgname=beautysh
pkgver=6.2.1
pkgrel=1
pkgdesc="A Bash beautifier for the masses"
arch=('any')
url='https://github.com/bemeurer/beautysh'
license=('MIT')
depends=(
    python-colorama
    python-setuptools
)
source=(
    "https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
    setup.patch
)
sha256sums=(
    423e0c87cccf2af21cae9a75e04e0a42bc6ce28469c001ee8730242e10a45acd
    SKIP
)

prepare() {
    cd "${pkgname}-${pkgver}"

    patch < ../setup.patch
}

package() {
    cd "${pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
