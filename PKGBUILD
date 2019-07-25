# Maintainer: Kaio Augusto de Camargo <kaioaugusto.8@gmail.com>
# Contributor: Matthew Gamble <git@matthewgamble.net>

pkgname=python-luckydonald-utils
pkgver=0.76
pkgrel=1
pkgdesc="A collection of generic utilities for use in any python project"
arch=("any")
url="https://pypi.org/project/luckydonald-utils/#files"
license=("GPL3")
depends=("python")
makedepends=("python-setuptools")
optdepends=("python-crypto" "python-magic" "python-pillow" "python-pytz" "python-requests" "python-usersettings")
source=(
    "https://files.pythonhosted.org/packages/87/d1/f77b7a17876883c41e35cdda7f17e842ac422fcdc444d3fae821df1411e2/luckydonald-utils-0.76.tar.gz"
    "remove-pip-requirement.patch"
)
sha256sums=(
    "a61764553eb262180e7c53a7f63c38dd9c9abdd32403cfc4ee3839cc628903a0"
    "b91159f0ce525c209b6e71179bb38958e52c0b3cb04bba97e5e3f987e51ecb0a"
)

prepare() {
    cd "luckydonald-utils-${pkgver}"
    patch -p1 < "${srcdir}/remove-pip-requirement.patch"
}

package() {
    cd "luckydonald-utils-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
