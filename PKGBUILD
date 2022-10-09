# Maintainer: Cat2048
pkgname=datcord-bin
pkgver=0.3.2
pkgrel=4
pkgdesc="An open-source discord client."
arch=('x86_64')
url="https://github.com/gamingdoom/datcord"
license=('GPL3')
depends=(gtk3 mime-types dbus-glib ffmpeg nss ttf-font libpulse)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English'
            'xdg-desktop-portal: Screensharing with Wayland')
provides=(datcord)
conflicts=(datcord)
source=("https://github.com/gamingdoom/datcord/releases/latest/download/datcord-linux-$CARCH.tar.bz2"
               "datcord.desktop"
               "datcord.png")
sha256sums=('aef17e7d23db48659ea96bcc3807b8e83529f17681d0daef8755ee537c7399a5'
            '499449e339d56a2da68bef028cd56ff6fb060fc778e28cf5c0102245a2ad2d67'
            '35271384d45a68ee082fe54f4756647add043f13223d03b8684df9f224a055c3')

package() {
	mkdir -p "$pkgdir"/usr/bin/datcord.d
	cd "$srcdir/datcord"
        cp -R  * "$pkgdir"/usr/bin/datcord.d
	ln -s /usr/bin/datcord.d/datcord "$pkgdir"/usr/bin/datcord
	install -Dvm 775 "$srcdir"/datcord.desktop "$pkgdir"/usr/share/applications/datcord.desktop
	install -Dvm 775 "$srcdir"/datcord.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/datcord.png
}
