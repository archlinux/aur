# Maintainer: Kashif <kashifb+aur@gmail.com>
pkgname=matplotlib2tikz
pkgver=0.5.15
pkgrel=1
pkgdesc="Convert matplotlib figures into TikZ/PGFPlots"
url="https://github.com/nschloe/matplotlib2tikz"
depends=('python' 'python-numpy' 'python-matplotlib>=1.4.0' 'python-pillow')
makedepends=('python' )
license=('MIT')
arch=('any')
source=('https://github.com/nschloe/matplotlib2tikz/archive/v0.5.15.zip')
md5sums=('1344f5a34f76a9064b2fb2d5c6e2aded')

build() {
    cd $srcdir/matplotlib2tikz-0.5.15
    python setup.py build
}

package() {
    cd $srcdir/matplotlib2tikz-0.5.15
    python setup.py install --root="$pkgdir" --optimize=1 
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
