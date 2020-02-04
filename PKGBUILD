# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=python-tikzplotlib
pkgver=0.9.1
pkgrel=1
pkgdesc="Convert matplotlib figures into TikZ/PGFPlots"
url="https://github.com/nschloe/tikzplotlib"
makedepends=('python')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-pillow')
replaces=('python-matplotlib2tikz')
conflicts=('python-matplotlib2tikz')
license=('MIT')
arch=('any')
source=("https://github.com/nschloe/tikzplotlib/archive/v${pkgver}.tar.gz")
sha256sums=('9fd34a55a0974e38e92b3d17adae7e059830c4b947e8572d1976b42753eecf05')

build() {
    cd $srcdir/tikzplotlib-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/tikzplotlib-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
