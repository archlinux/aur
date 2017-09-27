# Maintainer: Pavel Antonov <pvantonov@gmail.com>

pkgname=nuvolaruntime
pkgver=4.7.0
pkgrel=3
pkgdesc="Nuvola Apps Runtime - Tight integration of web apps with your desktop"
arch=("any")
url="https://github.com/tiliado/nuvola-app-google-play-music"
license=('custom:BSD')
provides=('nuvolaplayer')
conflicts=('nuvolaplayer')
depends=('python' 'vala' 'diorite>=4.7.0' 'glib2' 'ruby-gio2' 'python-gobject2' 'gtk3' 'json-glib' 'webkit2gtk' 'libnotify' 'gstreamer' 'libdri2' 'libdrm')
makedepends=('scour' 'dri2proto')
source=(https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('6b4da3b371d2e3259b86317fd3c6fde2142912b84d7a5d1563adfafeb67b147c')
optdepends=(
'nuvola-app-8tracks:			8tracks integration for Nuvola Player.'
'nuvola-app-amazon-cloud-player:	amazon cloud player integration for Nuvola Player.'
'nuvola-app-bandcamp:			bandcamp integration for Nuvola Player.'
'nuvola-app-bbc-iplayer:		bbc iplayer integration for Nuvola Player.'
'nuvola-app-deezer:			deezer integration for Nuvola Player.'
'nuvola-app-google-calendar:		google calendar integration for Nuvola Player.'
'nuvola-app-google-play-music:		Google Play integration for Nuvola Player.'
'nuvola-app-groove:			groove integration for Nuvola Player.'
'nuvola-app-jango:			jango integration for Nuvola Player.'
'nuvola-app-jupiter-broadcasting:	Jupiter broadcasting integration for Nuvola Player.'
'nuvola-app-kexp:			kexp integration for Nuvola Player.'
'nuvola-app-mixcloud:			mixcloud integration for Nuvola Player.'
'nuvola-app-owncloud-music:		owncloud music integration for Nuvola Player.'
'nuvola-app-plex:			plex integration for Nuvola Player.'
'nuvola-app-pocket-casts:		pocket casts integration for Nuvola Player.'
'nuvola-app-siriusxm:			siriusxm integration for Nuvola Player.'
'nuvola-app-soundcloud:			soundcloud integration for Nuvola Player.'
'nuvola-app-spotify:			spotify integration for Nuvola Player.'
'nuvola-app-tunein:			tunein integration for Nuvola Player.'
'nuvola-app-yandex-music:		yandex music integration for Nuvola Player.'
'nuvola-app-youtube:			youtube integration for Nuvola Player.'
'libdbusmenu-glib:			Library for passing menus over DBus'
'libappindicator-gtk2:			Systray icon support'
'libappindicator-gtk3:                  Systray icon support'
'libappindicator-sharp:                 Systray icon support'
'engine.io-client:			Cross-browser/cross-device bi-directional communication layer for Socket.IO.'
'unit.js:				Unit testing framework for javascript / Node.js.'
)
build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./waf configure --prefix=/usr --nounity --libdir=/usr/lib --noappindicator
    ./waf build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./waf install --destdir=${pkgdir}
}
