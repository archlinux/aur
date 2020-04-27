# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Weng Xuetian <wengxt@gmail.com>
# Contributor: Marc Mettke <marc@itmettke.de>

pkgname=firefox-kde-opensuse-rpm
_pkgver=75.0-830.3
pkgver=${_pkgver/-/_}
pkgrel=2
epoch=1  # Because of update from 74.0-823.6 to 74.0.1-824.1
pkgdesc="Standalone web browser from mozilla.org with OpenSUSE patch, integrate better with KDE - Binary from OBS"
arch=(x86_64)
license=("MPL" "GPL" "LGPL")
url="https://build.opensuse.org/package/show/mozilla:Factory/MozillaFirefox"
depends=("mozilla-common" "startup-notification" "mime-types"
         "dbus-glib"
         "libvpx"  "libevent" "hunspell"
         "libnotify" "kmozillahelper" "ffmpeg" "gtk3" "gtk2"
         # system av1
         "dav1d" "aom"
         # system webp
         "libwebp"
         # system libevent
         "libevent"
        )
optdepends=("networkmanager: Location detection via available WiFi networks"
            "speech-dispatcher: Text-to-Speech")
provides=("firefox=${pkgver}")
conflicts=("firefox" "firefox-kde-opensuse")
options=()
source=("https://download.opensuse.org/repositories/mozilla:/Factory/openSUSE_Factory/x86_64/MozillaFirefox-${_pkgver}.x86_64.rpm")
sha512sums=('9b8c5d9262f6d970d4bfafdcdae5adba185a703062a55785bcb7d54e736b79fab12777c8e6f6945ba82d22c3c5242f377af025fac3f86191391e0508f5a79214')


package() {
    cd "usr"
    
    install -d "${pkgdir}/usr/share" "${pkgdir}/usr/lib"
    
    install -Dm755 "bin/firefox" "${pkgdir}/usr/bin/firefox"
    cp -r share/{applications,icons,man,mime} "${pkgdir}/usr/share/"
    cp -r lib64/firefox "${pkgdir}/usr/lib/"
}
