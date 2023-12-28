# Maintainer: gavin lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/tv_viewer
pkgname=tv_viewer
pkgver=2.3
pkgrel=1
pkgdesc="GUI to view television show details using TV maze API. Python3 Pyqt5 SQLite"
arch=('any')
url="https://github.com/gavinlyonsrepo/tv_viewer"
license=('GPL')
depends=('python' 'python-prettytable' 'python-pyqt5' 'python-pytvmaze')
makedepends=('python-setuptools')
source=("https://github.com/gavinlyonsrepo/tv_viewer/archive/$pkgver.tar.gz")

sha256sums=('807f22e82c2698869cdd75eff70cffc7cc2aaa8e51d4d85de77968494f70941c')

package() {
    
    cd "$srcdir/tv_viewer-${pkgver}"
    
    install -D  -m644 desktop/tv_viewer.desktop "$pkgdir/usr/share/applications/tv_viewer.desktop"
    install -D  -m644 desktop/tv_viewer.png "$pkgdir/usr/share/pixmaps/tv_viewer.png"
    
    python setup.py install --prefix=/usr --root="$pkgdir"
}
