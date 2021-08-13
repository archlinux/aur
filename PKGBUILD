# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=python-tikzplotlib
pkgver=0.9.12
pkgrel=2
pkgdesc="Convert matplotlib figures into TikZ/PGFPlots"
url="https://github.com/nschloe/tikzplotlib"
makedepends=('python-setuptools')
depends=('python-matplotlib' 'python-pillow')
license=('MIT')
arch=('any')
source=("python-tikzplotlib-v${pkgver}.tar.gz::https://github.com/nschloe/tikzplotlib/archive/refs/tags/${pkgver}.tar.gz"
        "setup.py")
sha256sums=('feff006929712fb944f3678d234458da8f931bcabf56b1198a68d5ca70c5d4f4'
            '76189f7511a9eb8dab0ccaf022097f598fa32c3026ce2c2174ea7e7c3fccc71e')

prepare() {
    cd "${srcdir}/tikzplotlib-${pkgver}"
    ln -s ../setup.py
}

build() {
    cd "${srcdir}/tikzplotlib-${pkgver}"
    python setup.py build
}
package() {
    cd "${srcdir}/tikzplotlib-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
