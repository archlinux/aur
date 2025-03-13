# Maintainer: Sahil Gupte <ovenoboyo@gmail.com>

_pkgname=moosync
pkgname=${_pkgname}
pkgver=11.0.1
pkgrel=2
pkgdesc='A simple music player'
arch=('x86_64')
url='https://github.com/Moosync/Moosync'
license=('GPL3')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libappindicator-gtk3'
    'librsvg'
    'alsa-lib'
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-plugins-bad'
    'gst-plugins-ugly'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}-git")
source=(
    "${_pkgname}-${pkgver}.deb::https://github.com/Moosync/Moosync/releases/download/Moosync-v${pkgver}/Moosync_${pkgver}_amd64.deb"
    "moosync.desktop"
)
sha256sums=('SKIP'
            '4b63fa17717239db8a87ebeae1fdd96c5318b71d7d851d6c5a4f337793d3fecd')
noextract=("${_pkgname}-${pkgver}.deb")

prepare() {
    mkdir -p "${_pkgname}"
    cd "${_pkgname}"
    bsdtar -xf "../${_pkgname}-${pkgver}.deb"
    bsdtar -xf "data.tar.gz"
}

package() {
    cd "${_pkgname}"

    # Copy the application files
    cp -r "usr" "${pkgdir}/"
}
