# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-Maintainer: FLOZz <aru at flogisoft dot com>
pkgname=rst2gemtext
pkgver=0.4.0
pkgrel=1
pkgdesc='Converts reStructuredText to Gemtext (Gemini markup format)'
arch=('any')
url="https://github.com/flozz/rst2gemtext"
license=('GPL-3.0-only')
conflicts=("${pkgname}")
provides=("${pkgname}=${pkgver}")
depends=(
    'python>=3.12'
    'python-setuptools'
    'python-importlib-metadata'
)
options=(
    'zipman'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('69b789c27796dfd0b187b9aa3a889e7c16e713e4366939f81f1498ae356888e3')
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}