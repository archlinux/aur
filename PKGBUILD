# Maintainer: Cat2048
pkgname=datcord-bin
pkgver=0.3.4
pkgrel=1
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
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
	mkdir -p "$pkgdir"/usr/bin/datcord.d
	cd "$srcdir/datcord"
        cp -R  * "$pkgdir"/usr/bin/datcord.d
	ln -s /usr/bin/datcord.d/datcord "$pkgdir"/usr/bin/datcord
	install -Dvm 775 "$srcdir"/datcord.desktop "$pkgdir"/usr/share/applications/datcord.desktop
	install -Dvm 775 "$srcdir"/datcord.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/datcord.png
}
