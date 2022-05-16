# Maintainer: gavin lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/tv_viewer
pkgname=tv_viewer
pkgver=2.2
pkgrel=1
pkgdesc="GUI to view television show details using TV maze API. Python3 Pyqt5 SQLite"
arch=('any')
url="https://github.com/gavinlyonsrepo/tv_viewer"
license=('GPL')
depends=('python' 'python-prettytable' 'python-pyqt5' 'python-pytvmaze')
makedepends=('python-setuptools')
source=("https://github.com/gavinlyonsrepo/tv_viewer/archive/$pkgver.tar.gz")

sha256sums=('67a7d7132fe1388d743d712ea35e40cb2f3acd337d8e842e328b631ffae6d181')

package() {
    
    cd "$srcdir/tv_viewer-${pkgver}"
    
    install -D  -m644 desktop/tv_viewer.desktop "$pkgdir/usr/share/applications/tv_viewer.desktop"
    install -D  -m644 desktop/tv_viewer.png "$pkgdir/usr/share/pixmaps/tv_viewer.png"
    
    python setup.py install --prefix=/usr --root="$pkgdir"
}
