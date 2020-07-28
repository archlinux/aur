# Maintainer: spikecodes <19519553+spikecodes@users.noreply.github.com>
pkgname=peafox
pkgver=79.0a1
pkgrel=0.2
pkgdesc="Firefox fork hardened by default and without the telemetry."
arch=(i686 x86_64)
url="https://github.com/peacockweb/peafox"
license=(MPL GPL LGPL)
depends=(dbus-glib gtk3 libxt nss mime-types)
optdepends=('pulseaudio: audio support'
            'ffmpeg: h.264 video'
            'hunspell: spell checking'
            'hyphen: hyphenation'
            'libnotify: notification integration'
            'networkmanager: location detection via available WiFi networks'
            'speech-dispatcher: text-to-speech')
source=("https://github.com/peacockweb/peafox/releases/download/v"$pkgrel"/"$pkgname"_"$pkgver".deb")
noextract=('$pkgname_$pkgver.deb')
md5sums=('SKIP')

package() {
	ar -xvf "$pkgname"_"$pkgver".deb
	tar -xvf "$srcdir"/data.tar.xz -C "$pkgdir"
}
