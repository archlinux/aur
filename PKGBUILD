# Maintainer: Can Altıparmak (gulaghad) <can6parmak <AT> gmail <DOT> com>

pkgname=droidassault-hib
_pkgname=droidassault
pkgver=1395265019
pkgrel=2
pkgdesc="A unique tactical arcade shooter, with the fun addictive gameplay of classics like Paradroid and Quazatron. (Commercial)"
arch=('any')
url='http://www.puppygames.net/droid-assault/'
license=('custom:commercial')
depends=('java-runtime' 'openal' 'lwjgl')
conflicts=("droid-assault")
_gamepkg="DroidAssault-HIB_linux_$pkgver.tar.gz"
source=("$_gamepkg::hib://$_gamepkg"
        "droidassault.sh"
        "droidassault.desktop")
md5sums=('cf983be41c35969473a9b33b50dd8054'
         '79577c365e3faa05b4f18798975f2e5d'
         'c6d9b4b20727df8deff17e266eed0132')

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
    install -D -m 644 $srcdir/droidassault.desktop \
        $pkgdir/usr/share/applications/droidassault.desktop

# Link executable
    ln -s /opt/$_pkgname/$_pkgname.sh $pkgdir/usr/bin/$_pkgname

}
