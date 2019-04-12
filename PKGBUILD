# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
# Contributor: Kashif <kashifb+aur@gmail.com>
pkgname=python-matplotlib2tikz
pkgver=0.7.4
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
sha256sums=('a7680038a66b6cff54900b2658f2acb007635fecf1768b339fabb2440c712608')

build() {
    cd $srcdir/matplotlib2tikz-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/matplotlib2tikz-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
