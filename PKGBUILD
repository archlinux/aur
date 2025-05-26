# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-Maintainer: FLOZz <aru at flogisoft dot com>
pkgname=rst2gemtext
pkgver=0.4.0
pkgrel=2
pkgdesc="Converts reStructuredText to Gemtext (Gemini markup format)"
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
makedepends=(
    'git'
)
options=(
    'zipman'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
)
sha256sums=('a01b32c74ad4fbdc389277582ca9995f851a1044f4edcdf0c6bd0432a1b78bd4')
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}