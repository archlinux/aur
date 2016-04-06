pkgname=dosbox-aladdin
pkgver=1.0
pkgrel=1
pkgdesc="Aladdin - old DOS game"
arch=("any")
url="http://www.bestoldgames.net/eng/"
license=('Abandonware')
depends=('dosbox' 'sdl' 'unzip')

source=(
    'http://www.bestoldgames.net/download/bgames/aladdin.zip'
    'dosbox-aladdin.png'
    'dosbox-aladdin.desktop'
    'dosbox-aladdin.conf'
)

md5sums=('a8f4a9286bab7cb02faaefd8ed10adca'
         'd197130e15675233c5755b4b9233733a'
         '6fcfce3b346ff1744d83ac232be2ccb7'
         'd22100e58e0026d1e66b310a101cb8a3')

package () {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/dosbox-aladdin
    install -D -m644 dosbox-aladdin.conf ${pkgdir}/usr/local/games/dosbox-aladdin/dosbox-aladdin.conf
    install -D -m644 dosbox-aladdin.png ${pkgdir}/usr/share/pixmaps/dosbox-aladdin.png
    install -D -m644 dosbox-aladdin.desktop ${pkgdir}/usr/share/applications/dosbox-aladdin.desktop

    cp -r $srcdir/Aladdin/* ${pkgdir}/usr/local/games/dosbox-aladdin
}
