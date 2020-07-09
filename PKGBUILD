# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=python-tikzplotlib
pkgver=0.9.2
pkgrel=1
pkgdesc="Convert matplotlib figures into TikZ/PGFPlots"
url="https://github.com/nschloe/tikzplotlib"
makedepends=('python')
depends=('python-matplotlib' 'python-pillow')
license=('MIT')
arch=('any')
source=("https://github.com/nschloe/tikzplotlib/archive/v${pkgver}.tar.gz")
sha256sums=('cd6ce57dfff739ed5421a1e6a9a069d95dac33b8938bf52a3ed11f80bbe05104')

build() {
    cd "${srcdir}/tikzplotlib-${pkgver}/tikzplotlib"
    python -m compileall .
}

package() {
    cd "${srcdir}/tikzplotlib-${pkgver}"
    install -d "./tikzplotlib/" "${pkgdir}/usr/lib/python3.8/site-packages/tikzplotlib"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
