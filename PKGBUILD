# Maintainer: Kashif <kashifb+aur@gmail.com>
pkgname=matplotlib2tikz
pkgver=0.6.11
pkgrel=1
pkgdesc="Convert matplotlib figures into TikZ/PGFPlots"
url="https://github.com/nschloe/matplotlib2tikz"
depends=('python' 'python-numpy' 'python-matplotlib>=1.4.0' 'python-pillow')
makedepends=('python' )
license=('MIT')
arch=('any')
source=("https://github.com/nschloe/matplotlib2tikz/archive/v${pkgver}.tar.gz")
md5sums=('614c3b84f25ef04fa1dc99dfc8530454')

build() {
    cd $srcdir/matplotlib2tikz-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/matplotlib2tikz-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
