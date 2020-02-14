# Maintainer: Gu1ll0me <michaudg@gmail.com>
# Contributor: aimileus <me at aimileus dot nl>

pkgname=firefox-ubuntu-bin
_pkgname=firefox
pkgver=73.0
pkgrel=1
_ubuntuver="$pkgver+build3-0ubuntu0.19.10.1_amd64"
pkgdesc="Standalone web browser from mozilla.org with Ubuntu patches (binary)"
arch=("x86_64")
url="https://www.mozilla.org/firefox/"
license=('GPL' 'LGPL' 'MPL')
depends=('mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'hicolor-icon-theme'
	 'libvpx' 'icu'  'libevent' 'nss>=3.28.3' 'nspr>=4.10.6' 'hunspell'
	 'sqlite' 'libnotify' 'ffmpeg' 'gtk3'
         # system av1
         'dav1d' 'aom'
         # system harfbuzz
         'harfbuzz'
         # system graphite
         'graphite'
         # system webp
         'libwebp'
         # system libevent
         'libevent'
        )
optdepends=('networkmanager: Location detection via available WiFi networks'
            'speech-dispatcher: Text-to-Speech'
            'pulseaudio: Audio support'
			'appmenu-gtk-module: for KDE global menu'
			'libdbusmenu-gtk3: for KDE global menu')
provides=('firefox' 'firefox-ubuntu')
conflicts=('firefox' 'firefox-ubuntu')

source=("http://security.ubuntu.com/ubuntu/pool/main/f/firefox/firefox_$_ubuntuver.deb")
md5sums=('01b7323c4b52b05c46768963a720cd9f')

prepare() {
	# Don't extract copyright files, which are included in the licenses package
	tar -xvf data.tar.xz --exclude=usr/share/doc
}

package() {
	cp -r etc "$pkgdir/"
	cp -r usr "$pkgdir/"
}
