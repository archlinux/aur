pkgname=dosbox-arkanoid
pkgver=1.0
pkgrel=1
pkgdesc="Arkanoid - old DOS game"
arch=("any")
url="http://www.bestoldgames.net/eng/"
license=('Abandonware')
depends=('dosbox' 'sdl' 'unzip')

source=(
    'http://www.bestoldgames.net/download/bgames/arkanoid.zip'
    'dosbox-arkanoid.png'
    'dosbox-arkanoid.desktop'
    'dosbox-arkanoid.conf'
)

md5sums=('a3575138e6cba82571a06ed5d08138f7'
         '8f71a88cf8c2cc903f23de2d93bfc324'
         'dca66016ddfa02081731929f1e015120'
         'd5d0e37054fa757de79a289b0e4e7e32')

package () {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/dosbox-arkanoid
    install -D -m644 dosbox-arkanoid.conf ${pkgdir}/usr/local/games/dosbox-arkanoid/dosbox-arkanoid.conf
    install -D -m644 dosbox-arkanoid.png ${pkgdir}/usr/share/pixmaps/dosbox-arkanoid.png
    install -D -m644 dosbox-arkanoid.desktop ${pkgdir}/usr/share/applications/dosbox-arkanoid.desktop

    cp -r $srcdir/Arkanoid/* ${pkgdir}/usr/local/games/dosbox-arkanoid
}
