# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-Maintainer: FLOZz <aru at flogisoft dot com>
pkgname=rst2gemtext
pkgver=0.7.1
pkgrel=1
pkgdesc="Converts reStructuredText to Gemtext (Gemini markup format)."
arch=('any')
url="https://github.com/flozz/rst2gemtext"
license=('GPL-3.0-or-later')
depends=(
    'python>=3.10'
    'python-docutils'
    'python-pygments'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-flit-core'
    'python-wheel'
)
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e8ddf14fc5282716728d2e4f50bd472775676d28613786f0695a60f2bf092165')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}