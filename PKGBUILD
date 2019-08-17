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
sha256sums=("f7f7e08f64fcaed60b346ac6a2523034354ffe09b3e9486e363ef140c6cb7e17")

package() {
    cd "$srcdir/riccipy-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
