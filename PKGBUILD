# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: David Vilar <davvil@gmail.com>
pkgname=vassal
pkgver=3.7.5
pkgrel=1
pkgdesc="Game engine for building and playing online adaptations of board games and card games."
arch=('i686' 'x86_64')
url="http://www.vassalengine.org/"
license=('LGPL')
depends=('java-runtime>=11')
source=(https://github.com/vassalengine/vassal/releases/download/${pkgver}/VASSAL-${pkgver}-linux.tar.bz2
    VASSAL-256x256.png
    vassal.sh
    vassal.desktop)
noextract=()
md5sums=('692e4cdb69767ec0399c96b5722ba2cc'
         '4a4ec11bdbd7dbbf56e6f1d533f69a7e'
         '0dd91b887bb07f350381d3bcbbe47530'
         '8f3d525cd698789c17c6ac9428ef0378')
build() {
    true
}

package() {
    cd "$srcdir/VASSAL-$pkgver"
    destdir=$pkgdir/usr/share/java/$pkgname

    mkdir -p $destdir

    cp -r doc lib $destdir

    mkdir -p $pkgdir/usr/bin
    install -Dm755 ${srcdir}/vassal.sh $pkgdir/usr/bin/vassal
    chmod a+x $pkgdir/usr/bin/vassal

    mkdir -p $destdir/images
    cp $srcdir/VASSAL-256x256.png $destdir/images

    mkdir -p $pkgdir/usr/share/applications

    install -Dm644 ${srcdir}/vassal.desktop $pkgdir/usr/share/applications/vassal.desktop
}

# vim:set ts=2 sw=2 et:
