# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=python-tikzplotlib
pkgver=0.9.10
pkgrel=1
pkgdesc="Convert matplotlib figures into TikZ/PGFPlots"
url="https://github.com/nschloe/tikzplotlib"
makedepends=('python-pip')
depends=('python-matplotlib' 'python-pillow')
license=('MIT')
arch=('any')
source=("https://github.com/nschloe/tikzplotlib/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b07cc4e581199151c85b015b4bd59307884b7eabe07b92337d0c8a74ef5fdf68')

package() {
    cd "${srcdir}/tikzplotlib-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps --compile .
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
