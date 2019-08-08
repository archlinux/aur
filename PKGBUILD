# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=python-tikzplotlib
pkgver=0.8.2
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
sha256sums=('bc7aab72c65fc224cdc36fd1987a5e61ef1f27b3381b68b408cdb98f8bec0000')

build() {
    cd $srcdir/tikzplotlib-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/tikzplotlib-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
