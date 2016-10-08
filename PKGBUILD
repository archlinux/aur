#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgname=python-mahotas
shrtname=mahotas
pkgver=1.4.3
pkgrel=2
pkgdesc="A fast computer vision algorithms (all implemented in C++) operating over numpy arrays"
url="http://luispedro.org/software/mahotas"
depends=('python' 'python-numpy')
makedepends=('python-matplotlib' 'python-numpydoc' 'gcc' )
checkdepends=('python-scipy' 'python-imread' 'python-nose' 'python-pillow')
license=('MIT')
arch=('i686' 'x86_64')
source=(https://pypi.python.org/packages/3d/b5/93cfcd0e3f87885fe4a433e3712182079915a1eda40ee86169dc57aad558/$shrtname-$pkgver.tar.gz)
sha256sums=('e113fb73f1f717f1a9124b41496b030628efb72a23b0150a42ecb18b08b030c4')

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
