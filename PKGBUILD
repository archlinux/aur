#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgname=python-mahotas
shrtname=mahotas
pkgver=1.4.0
pkgrel=2
pkgdesc="A fast computer vision algorithms (all implemented in C++) operating over numpy arrays"
url="http://luispedro.org/software/mahotas"
depends=('python' 'python-numpy')
makedepends=('python' 'python-matplotlib' 'gcc' )
checkdepends=('python-scipy' 'python-imread' 'python-nose' 'python-pillow')
license=('MIT')
arch=('i686' 'x86_64')
source=(https://pypi.python.org/packages/source/m/mahotas/$shrtname-$pkgver.tar.gz)
sha256sums=('73c2f13da9eddf959594cacd3e3f7d42bc933a6ae75048cb0360576668f21fc2')

build() {
    cd $srcdir/$shrtname-$pkgver
    python setup.py build
}

check() {
    cd $srcdir/$shrtname-$pkgver
    python setup.py test
}

package() {
    cd $srcdir/$shrtname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -m755 -d "${pkgdir}/usr/share/licenses/python-mahotas"
    install -m644 COPYING "${pkgdir}/usr/share/licenses/python-mahotas/LICENSE.txt"
}
