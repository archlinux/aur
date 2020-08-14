# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=python-tikzplotlib
pkgver=0.9.3
pkgrel=1
pkgdesc="Convert matplotlib figures into TikZ/PGFPlots"
url="https://github.com/nschloe/tikzplotlib"
makedepends=('python')
depends=('python-matplotlib' 'python-pillow')
license=('MIT')
arch=('any')
source=("https://github.com/nschloe/tikzplotlib/archive/v${pkgver}.tar.gz")
sha256sums=('13f27ca9e2773fd63553b380eba150863139e64ed8d38cc64c92d589f6a47264')

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
