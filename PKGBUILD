# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Weng Xuetian <wengxt@gmail.com>
# Contributor: Marc Mettke <marc@itmettke.de>

pkgname=firefox-kde-opensuse-rpm
_ffver=76.0.1
_revision=835.5
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
sha512sums=('a62debcf3135f9d298d8af49e6e79298e575b0f855a1f923173b7f73902e92483562ba312e05ce61d9ca1cf25dbbb13442116b110d3898b40902f7bf052f0cd2')


package() {
    cd "usr"

    install -d "${pkgdir}/usr/share" "${pkgdir}/usr/lib"

    install -Dm755 "bin/firefox" "${pkgdir}/usr/bin/firefox"
    cp -r share/{applications,icons,man,mime} "${pkgdir}/usr/share/"
    cp -r lib64/firefox "${pkgdir}/usr/lib/"
}
