# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Weng Xuetian <wengxt@gmail.com>
# Contributor: Marc Mettke <marc@itmettke.de>

pkgname=firefox-kde-opensuse-rpm
 _pkgver=76.0.1-833.1
pkgver=${_pkgver/-/_0_}
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
source=("https://download.opensuse.org/repositories/mozilla:/Factory/openSUSE_Factory/x86_64/MozillaFirefox-${_pkgver}.x86_64.rpm")
sha512sums=('ccea48f3f06c5afc5a03dccf5d17071f71af96f3d71c49903228eb6442b263755c0a3bb8e043b70ae1291bd01db38e830d3c219b9eb53d0046077150af3e50b8')


package() {
    cd "usr"

    install -d "${pkgdir}/usr/share" "${pkgdir}/usr/lib"

    install -Dm755 "bin/firefox" "${pkgdir}/usr/bin/firefox"
    cp -r share/{applications,icons,man,mime} "${pkgdir}/usr/share/"
    cp -r lib64/firefox "${pkgdir}/usr/lib/"
}
