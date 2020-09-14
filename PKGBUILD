# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=python-tikzplotlib
pkgver=0.9.4
pkgrel=1
pkgdesc="Convert matplotlib figures into TikZ/PGFPlots"
url="https://github.com/nschloe/tikzplotlib"
makedepends=('python')
depends=('python-matplotlib' 'python-pillow')
license=('MIT')
arch=('any')
source=("https://github.com/nschloe/tikzplotlib/archive/v${pkgver}.tar.gz")
sha256sums=('8d3c1a48269c5687b9cfd00292c283a980bd84bf5b15baf6aa805b369a876ebd')

build() {
    cd "${srcdir}/tikzplotlib-${pkgver}/tikzplotlib"
    python -m compileall .
}

package() {
    cd "${srcdir}/tikzplotlib-${pkgver}"
    install -d "${pkgdir}/usr/lib/python3.8/site-packages/"
    cp -r  tikzplotlib "${pkgdir}/usr/lib/python3.8/site-packages/tikzplotlib"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
