# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Weng Xuetian <wengxt@gmail.com>
# Contributor: Marc Mettke <marc@itmettke.de>

pkgname=firefox-kde-opensuse-rpm
_pkgver=74.0-821.1
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org with OpenSUSE patch, integrate better with KDE - Binary from OBS"
arch=(x86_64)
license=('MPL' 'GPL' 'LGPL')
url="https://build.opensuse.org/package/show/mozilla:Factory/MozillaFirefox"
depends=('mozilla-common' 'startup-notification' 'mime-types'
         'dbus-glib'
         'libvpx'  'libevent' 'hunspell'
         'libnotify' 'kmozillahelper' 'ffmpeg' 'gtk3' 'gtk2'
         # system av1
         'dav1d' 'aom'
         # system webp
         'libwebp'
         # system libevent
         'libevent'
        )
optdepends=('networkmanager: Location detection via available WiFi networks'
            'speech-dispatcher: Text-to-Speech')
provides=("firefox=${pkgver}")
conflicts=('firefox' 'firefox-kde-opensuse')
options=()

source=("https://download.opensuse.org/repositories/mozilla:/Factory/openSUSE_Factory/x86_64/MozillaFirefox-${_pkgver}.x86_64.rpm")

sha512sums=('9dfe22e093d0947272b6006fe3d7ecdead81380344a4b2729789df756334207b73cafc9606c8bcd98231088b5e11ec264cd6f0376bb6ff4164c8c1b331b6a026')

package() {
    cd "usr"
    
    install -d "${pkgdir}/usr/share" "${pkgdir}/usr/lib"
    
    install -Dm755 "bin/firefox" "${pkgdir}/usr/bin/firefox"
    cp -r share/{applications,icons,man,mime} "${pkgdir}/usr/share/"
    cp -r lib64/firefox "${pkgdir}/usr/lib/"
}
