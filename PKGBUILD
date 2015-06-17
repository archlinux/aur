# Maintainer: Tanguy ALEXIS <tanguy@metatux.fr>
# Contributer: Shaun Hammill <plloi.pllex@gmail.com>
# Contributer: Travis Lyons <travis.lyons@gmail.com>

pkgname=magicassistant-gtk
pkgver=1.4.2.010
pkgrel=1
pkgdesc="Card Browser, Library Organizer, Deck Builder and Tournament Manager for Magic the Gathering Card Game"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/mtgbrowser/"
license=('EPL')
depends=(gtk2 'java-runtime>=8' unzip libwebkit)
source_x86_64=(http://downloads.sourceforge.net/project/mtgbrowser/Magic_Assistant/${pkgver}/magicassistant-${pkgver}-linux.gtk.x86_64.zip magicassistant.desktop)
source_x86=(http://downloads.sourceforge.net/project/mtgbrowser/Magic_Assistant/${pkgver}/magicassistant-${pkgver}-linux.gtk.x86.zip magicassistant.desktop)
md5sums_x86_64=('65884e4a7666ff510938cb21f171f8dc'
                '37f143dbb28032d4fcc7a0a6e4e7f239')
md5sums_x86_64=('2336f6b62536137bafc8ded226551d6d'
                '37f143dbb28032d4fcc7a0a6e4e7f239')

package() {
    msg "Installing..."
    install -d "$pkgdir"/{/usr/bin,/opt,/usr/share/applications}
    install -m644 $srcdir/magicassistant.desktop $pkgdir/usr/share/applications/magicassistant.desktop
    mv $srcdir/MagicAssistant $pkgdir/opt
    msg "Link to bin..."
    ln -s /opt/MagicAssistant/magicassistant $pkgdir/usr/bin/magicassistant
    msg2 "Done!"
}


# vim:set ts=2 sw=2 et
