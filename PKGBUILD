# Maintainer: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Weng Xuetian <wengxt@gmail.com>
# Maintainer (bin-version): Marc Mettke <marc@itmettke.de>

pkgname=firefox-kde-opensuse-bin
pkgver=60.0.1
pkgrel=2
pkgdesc="Standalone web browser from mozilla.org with OpenSUSE patch, integrate better with KDE"
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://build.opensuse.org/package/show/mozilla:Factory/MozillaFirefox"
depends=('mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'hicolor-icon-theme'
	 'libvpx' 'icu'  'libevent' 'nss>=3.28.3' 'nspr>=4.10.6' 'hunspell'
	 'sqlite' 'libnotify' 'kmozillahelper' 'ffmpeg' 'gtk3')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'speech-dispatcher: Text-to-Speech')
provides=("firefox=${pkgver}")
conflicts=('firefox' 'firefox-kde-opensuse')
options=('!emptydirs'  'strip')

source=(https://repo.itmettke.de/aur-archive/packages/f/firefox-kde-opensuse/firefox-kde-opensuse-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz{,.sig})
noextract=(firefox-kde-opensuse-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz)
validpgpkeys=(81E604C18BFD3FA9986E32D91E74416BECD445A4)
sha256sums=(
	'803d3d35fe93af73ccf12a8c43dd95e69d4f2995a640b8ec927dfd041e2386f1'
	'SKIP'
)

package() {
	tar -xvf $srcdir/firefox-kde-opensuse-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz -C $pkgdir --exclude=".*"
}
