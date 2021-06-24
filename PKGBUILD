# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=python-tikzplotlib
pkgver=0.9.9
pkgrel=1
pkgdesc="Convert matplotlib figures into TikZ/PGFPlots"
url="https://github.com/nschloe/tikzplotlib"
makedepends=('python-pip')
depends=('python-matplotlib' 'python-pillow')
license=('MIT')
arch=('any')
source=("https://github.com/nschloe/tikzplotlib/archive/v${pkgver}.tar.gz")
sha256sums=('738987398026010f114d458ad921dbb8b957a2467ff4fdd91ac9b46aff34fd1c')

package() {
    cd "${srcdir}/tikzplotlib-${pkgver}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps --compile .
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
