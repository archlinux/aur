# Maintainer: Cat2048
pkgname=datcord-bin
pkgver=0.5.0
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
	mkdir -p "$pkgdir"/usr/lib/datcord "$pkgdir"/usr/bin
	cd "$srcdir/datcord"
	chmod +x launch-app
        cp -R  * "$pkgdir"/usr/lib/datcord
	ln -s /usr/lib/datcord/launch-app "$pkgdir"/usr/bin/datcord
	install -Dvm 775 "$srcdir"/datcord.desktop "$pkgdir"/usr/share/applications/datcord.desktop
	install -Dvm 775 "$srcdir"/datcord.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/datcord.png
}
