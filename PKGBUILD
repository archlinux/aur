# Maintainer: Kashif <kashifb+aur@gmail.com>
pkgname=matplotlib2tikz
pkgver=0.5.7
pkgrel=1
pkgdesc="convert matplotlib figures into TikZ/PGFPlots"
url="https://github.com/nschloe/matplotlib2tikz"
depends=('python' 'python-numpy' 'python-matplotlib>=1.4.0' 'python-pillow')
makedepends=('python' )
license=('MIT')
arch=('any')
source=('https://pypi.python.org/packages/8d/4f/c6bd49ce3a4b904e4301edb6d8806f911ead3182a19cdf0da9710ef1ab0c/matplotlib2tikz-0.5.7.tar.gz' 'https://github.com/nschloe/matplotlib2tikz/archive/v0.5.7.zip')
md5sums=('251e41703875a6182658c6aefde401c6' '5564bb8a9c2b3a93cb2d7b1de7801538')

build() {
    cd $srcdir/matplotlib2tikz-0.5.7
    python setup.py build
}

package() {
    cd $srcdir/matplotlib2tikz-0.5.7
    python setup.py install --root="$pkgdir" --optimize=1 
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
