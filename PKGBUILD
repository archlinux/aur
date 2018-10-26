# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
# Contributor: Kashif <kashifb+aur@gmail.com>
pkgname=python-matplotlib2tikz
pkgver=0.6.18
pkgrel=1
pkgdesc="Convert matplotlib figures into TikZ/PGFPlots"
url="https://github.com/nschloe/matplotlib2tikz"
makedepends=('python')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-pillow')
replaces=('matplotlib2tikz')
conflicts=('matplotlib2tikz')
license=('MIT')
arch=('any')
source=("https://github.com/nschloe/matplotlib2tikz/archive/v${pkgver}.tar.gz")
sha256sums=('cc2cc5b09bc56c6c5e9fdece02c7e6a8abed5049cc0275f2b019dbc19ec1dc8f')

build() {
    cd $srcdir/matplotlib2tikz-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/matplotlib2tikz-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
