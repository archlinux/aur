# Maintainer: Johan Reitan (venatux) <johan.reitan@gmail.com>
# Contributer: Kenneth Lyons (ixjlyons) <ixjlyons@gmail.com>

pkgname=python-poppler-qt5
pkgver=0.24.2
pkgrel=2
pkgdesc='Python binding to libpoppler-qt5.'
arch=('any')
url='https://github.com/wbsoft/python-poppler-qt5'
license=('LGPL')
depends=('python-pyqt5' 'poppler-qt5')
makedepends=('python-sip')
provides=('python-poppler-qt5')
conflicts=('python-poppler-qt5')
source=(https://github.com/wbsoft/python-poppler-qt5/archive/v${pkgver}.tar.gz
        ${pkgname}-${pkgver}.patch)
sha256sums=('542b5ab183e95debd4e05642425da6914e1b5c5a98a8c94752833d5b5ca7289b'
            '503c6e0eded717d82cab98459cf10b1eddee73ed45df441f79889aa05e8dcf74')

prepare() {
    cd $srcdir/$pkgname-$pkgver
    patch -p1 -i $srcdir/$pkgname-$pkgver.patch
}

package() {
    cd $srcdir/$pkgname-$pkgver
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
}
