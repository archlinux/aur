# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Weng Xuetian <wengxt@gmail.com>
# Contributor: Marc Mettke <marc@itmettke.de>

pkgname=firefox-kde-opensuse-rpm
_ffver=77.0.1
_revision=1.1
pkgver=${_ffver}_0_${_revision}
pkgrel=1
epoch=2  # Because of update 76.0.1-833.1
pkgdesc="Standalone web browser from mozilla.org with OpenSUSE patch, integrate better with KDE - Binary from OBS"
arch=(x86_64 i686)
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
source_x86_64=("https://download.opensuse.org/repositories/openSUSE:/Factory/standard/x86_64/MozillaFirefox-${_ffver}-${_revision}.x86_64.rpm")
source_i686=("https://download.opensuse.org/repositories/openSUSE:/Factory/standard/i686/MozillaFirefox-${_ffver}-${_revision}.i686.rpm")
sha512sums_x86_64=('68c022dc50d0b96752d120109267846d9731b59946a3d536762b16b79e941ad5435d3b32feefeface1073fbea7a7e6019705e2fc1926bec4ff40573877384e0e')
sha512sums_i686=('8fcbe72aa74c0831c76a9312ad38b4a9273297e5d16813c74fac41668c429f2461c7bdc883443d0c9ef46a14f53da6d56eb7956a7dbab62f0725279f55c30e57')


package() {
    cd "usr"

    install -d "${pkgdir}/usr/share" "${pkgdir}/usr/lib"

    install -Dm755 "bin/firefox" "${pkgdir}/usr/bin/firefox"
    cp -r share/{applications,icons,man,mime} "${pkgdir}/usr/share/"
    cp -r lib64/firefox "${pkgdir}/usr/lib/"
}
