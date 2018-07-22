# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
# Contributor: Kashif <kashifb+aur@gmail.com>
pkgname=python-matplotlib2tikz
pkgver=0.6.17
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
sha256sums=('8f85f056683eefa162696abe135685a9745f7b3146e38f41d1f75f90d4792184')

build() {
    cd $srcdir/matplotlib2tikz-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/matplotlib2tikz-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
