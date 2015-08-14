# Maintainer: Can Altıparmak (c6parmak) <can6parmak <AT> gmail <DOT> com>

pkgname=ultratron-hib
_pkgname=ultratron
pkgver=1395265019
pkgrel=3
pkgdesc="Intense shoot-em-up with 100% pure frenzied gameplay. (Commercial)"
arch=('any')
url='http://www.puppygames.net/ultratron/'
license=('custom:commercial')
depends=('java-runtime' 'openal' 'lwjgl2')
conflicts=("ultratron")
source=("hib://Ultratron-HIB_$pkgver.tar.gz"
        "ultratron.sh"
        "ultratron.desktop")
md5sums=('a7833a3fe3cccc5833fcfa36479c11fb'
         '9f0a87d5be57ea81e8d94133ebf05e40'
         '12feb119173b94a44285444088777314')

package() {
# Create pkgdir folders
    install -d $pkgdir/usr/bin
    install -d $pkgdir/opt/$_pkgname

# Copy game
    cp -a $srcdir/$_pkgname/*.jar $pkgdir/opt/$_pkgname

# Install Launcher, Icon
    install -D -m 755 $srcdir/$_pkgname.sh $pkgdir/opt/$_pkgname
    install -D -m 644 $srcdir/$_pkgname/$_pkgname.png \
        $pkgdir/usr/share/pixmaps/$_pkgname.png
    install -D -m 644 $srcdir/$_pkgname.desktop \
        $pkgdir/usr/share/applications/$_pkgname.desktop

# Link executable
    ln -s /opt/$_pkgname/$_pkgname.sh $pkgdir/usr/bin/$_pkgname
    cd $srcdir
}
