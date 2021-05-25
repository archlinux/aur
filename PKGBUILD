# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Maintainer: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Weng Xuetian <wengxt@gmail.com>
# Contributor: Marc Mettke <marc@itmettke.de>

pkgname=firefox-kde-opensuse-bin
pkgver=88.0.1
_pkgrel=1
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org with OpenSUSE patch, integrate better with KDE"
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://aur.archlinux.org/packages/firefox-kde-opensuse"
depends=('libxt' 'mime-types'
         'dbus-glib' 'hicolor-icon-theme'
         'libvpx' 'icu'  'libevent' 'nss>=3.28.3' 'nspr>=4.10.6' 'hunspell'
         'sqlite' 'libnotify' 'kmozillahelper' 'ffmpeg' 'gtk3'
         # system av1
         'dav1d' 'aom'
         # system harfbuzz
         'harfbuzz'
         # system graphite
         'graphite-mozilla'
         # system webp
         'libwebp'
         # system libevent
         'libevent'
        )
optdepends=('networkmanager: Location detection via available WiFi networks'
            'speech-dispatcher: Text-to-Speech')
provides=("firefox=${pkgver}")
conflicts=('firefox' 'firefox-kde-opensuse')
options=('!emptydirs' 'debug' 'strip')

source=(https://thaodan.de/public/archlinux/home-thaodan/x86_64/firefox-kde-opensuse-${pkgver}-${_pkgrel}-x86_64.pkg.tar.xz{,.sig})
noextract=(firefox-kde-opensuse-${pkgver}-${_pkgrel}-x86_64.pkg.tar.xz)
validpgpkeys=(
        BBFE2FD421597395E4FC8C8DF6C85FEE79D661A4 # Björn "Thaodan" Bidar <theodorstormgrade@gmail.com>
)

sha256sums=('1e7bf61334b41c22af17fd812ceae510dd743a8acdf683848be8ae3dee8b386f'
            'SKIP')

package() {
	tar -xf $srcdir/firefox-kde-opensuse-${pkgver}-${_pkgrel}-x86_64.pkg.tar.xz -C $pkgdir --exclude=".*"
}

