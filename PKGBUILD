# $Id: PKGBUILD 60201 2011-12-07 14:41:34Z arodseth $
# Maintainer  : Lucjan SQ5FGB <lucck at boff dot pl>

pkgname=vna_j
_realname=vnaJ
pkgver=2.8.6f
pkgrel=1
pkgdesc="HAMRADIO MiniVNA MAX6 network analyser software"
arch=('any')
license=('custom')
url="http://dl2sba.com/index.php?option=com_content&view=article&id=39&Itemid=29"
depends=('java-environment' 'hicolor-icon-theme' 'bash')
optdepends=('xdg-utils: desktop & menu shortcut support')
makedepends=('imagemagick')
install=vna_j.install
source=(http://download.dl2sba.com/vnaj/$pkgver/${_realname}.${pkgver}.jar
        vnaJ.sh vnaJ.desktop http://download.dl2sba.com/vnaj/$pkgver/logo.ico)
md5sums=('9f126a96eedfe17788e097f12c9c40e4'
         '305963e8e79cbab0741a535207020e2c'
         'e1f40625326a65e5df479f4eae742041'
         '9f3eed2cc9491779155f111d9e3d6bfd')

package() {
    mkdir -p "$pkgdir"{/usr/bin,/usr/share/java/$pkgname}

    # Copying the argo script to /usr/bin
    install -m755 vnaJ.sh "$pkgdir"/usr/bin/vnaJ

    #cd "$srcdir/$pkgname-$pkgver
    # Copying necessary files
    cp ${_realname}.${pkgver}.jar "$pkgdir"/usr/share/java/$pkgname/$_realname.jar
    # Install resources
    convert logo.ico logo.png
    install -D -m644 "$srcdir"/logo-0.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/vnaJ.png
    install -D -m644 "$srcdir"/vnaJ.desktop "$pkgdir"/usr/share/applications/vnaJ.desktop
}
