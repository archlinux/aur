# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
# Contributor: Kashif <kashifb+aur@gmail.com>
pkgname=matplotlib2tikz
pkgver=0.6.15
pkgrel=1
pkgdesc="Convert matplotlib figures into TikZ/PGFPlots"
url="https://github.com/nschloe/matplotlib2tikz"
makedepends=('python')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-pillow')
license=('MIT')
arch=('any')
source=("https://github.com/nschloe/matplotlib2tikz/archive/v${pkgver}.tar.gz")
sha256sums=('337dc015dabfc140a94ccd25a7d1afa4d0546ee715dacb323733b33aa1c4a59f')

build() {
    cd $srcdir/matplotlib2tikz-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/matplotlib2tikz-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
