# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Weng Xuetian <wengxt@gmail.com>
# Contributor: Marc Mettke <marc@itmettke.de>

pkgname=firefox-kde-opensuse-rpm
_ffver=76.0.1
_revision=835.2
pkgver=${_ffver}_0_${_revision}
pkgrel=1
epoch=2  # Because of update 76.0.1-833.1
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
source=("https://download.opensuse.org/repositories/mozilla:/Factory/openSUSE_Factory/x86_64/MozillaFirefox-${_ffver}-${_revision}.x86_64.rpm")
sha512sums=('b19e1051a0fe617f353fed2c5f3b54b21c9feafbdd7b848b87f6fb9a0c636a37caec3dd9fdc70013712ae040bb9314dde088d11df09ee3a63ad93f78651b7d00')


package() {
    cd "usr"

    install -d "${pkgdir}/usr/share" "${pkgdir}/usr/lib"

    install -Dm755 "bin/firefox" "${pkgdir}/usr/bin/firefox"
    cp -r share/{applications,icons,man,mime} "${pkgdir}/usr/share/"
    cp -r lib64/firefox "${pkgdir}/usr/lib/"
}
