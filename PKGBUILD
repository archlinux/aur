# Maintainer: cjayross <calvinjayross at gmail dot com>

pkgname=python-riccipy
pkgver=0.1a
pkgrel=1
pkgdesc="A Python3 symbolic calculator for General Relativity"
arch=("any")
url="https://github.com/cjayross/riccipy"
license=("MIT")
depends=("python" "python-sympy" "python-numpy" "python-yaml")
makedepends=("python-setuptools")
options=("!emptydirs")
source=("https://github.com/cjayross/riccipy/archive/v${pkgver}.tar.gz")
sha256sums=("8a13ed362a8128df19059ed27b33e24070cdde667befb109fae6eca7a0e885b2")

package() {
    cd "$srcdir/riccipy-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
