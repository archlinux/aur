# Maintainer: Lukas Morawietz <lukas.morawietz@gmail.com>
# Contributor: Silvio Ankermann <silvio@booq.org>
# Contributor: Tanguy ALEXIS <tanguy@metatux.fr>
# Contributor: Shaun Hammill <plloi.pllex@gmail.com>
# Contributor: Travis Lyons <travis.lyons@gmail.com>

pkgname=magicassistant-gtk
pkgver=1.5.1.201904160221
pkgrel=1
pkgdesc="Card Browser, Library Organizer, Deck Builder and Tournament Manager for Magic the Gathering Card Game"
arch=(x86_64)
url="http://sourceforge.net/projects/mtgbrowser/"
license=('EPL')
depends=(gtk2 'java-runtime>=8' unzip webkitgtk)
source_x86_64=(https://downloads.sourceforge.net/project/mtgbrowser/Magic_Assistant/1.5.0/magicassistant-${pkgver}-linux.gtk.x86_64.zip magicassistant.desktop)
sha1sums_x86_64=('11d3f7f15689080d229950dba67689d346cbc0d2'
                 '505df40fea145a68ba3bed4b813a7668c61caeda')

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
