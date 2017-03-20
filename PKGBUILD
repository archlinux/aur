# Maintainer: Silvio Ankermann <silvio@booq.org>
# Contributer: Tanguy ALEXIS <tanguy@metatux.fr>
# Contributer: Shaun Hammill <plloi.pllex@gmail.com>
# Contributer: Travis Lyons <travis.lyons@gmail.com>

pkgname=magicassistant-gtk
pkgver=1.5.1.201703191921
pkgrel=1
pkgdesc="Card Browser, Library Organizer, Deck Builder and Tournament Manager for Magic the Gathering Card Game"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/mtgbrowser/"
license=('EPL')
depends=(gtk2 'java-runtime>=8' unzip webkitgtk)
source_x86_64=(https://downloads.sourceforge.net/project/mtgbrowser/Magic_Assistant/1.5.0/magicassistant-${pkgver}-linux.gtk.x86_64.zip magicassistant.desktop)
source_x86=(https://downloads.sourceforge.net/project/mtgbrowser/Magic_Assistant/1.5.0/magicassistant-${pkgver}-linux.gtk.x86.zip magicassistant.desktop)
md5sums_x86_64=('cd88ec3bbb4b164fe609dffa16a92b81'
                '37f143dbb28032d4fcc7a0a6e4e7f239')
md5sums_x86=('6adc5760d09dc7cf353210ead16343bb'
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
