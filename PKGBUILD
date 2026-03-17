# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="handy-bin"
pkgver=0.7.11
pkgrel=1
pkgdesc="A free, open source, and extensible speech-to-text application that works completely offline"
url="https://handy.computer/"
license=("MIT")
arch=("x86_64")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(
    "alsa-lib"
    "cairo"
    "gcc-libs"
    "gdk-pixbuf2"
    "glib2"
    "glibc"
    "gtk3"
    "hicolor-icon-theme"
    "libappindicator-gtk3"
    "libsoup3"
    "openssl"
    "vulkan-icd-loader"
    "webkit2gtk-4.1"
)
source=("${pkgname}-${pkgver}.deb::https://github.com/cjpais/Handy/releases/download/v${pkgver}/Handy_${pkgver}_amd64.deb"
        "https://raw.githubusercontent.com/cjpais/Handy/refs/heads/main/LICENSE")
b2sums=('57f340c4ae18e0757c4841d29419da376ee6a6a6143bea2c5d0bd36e02dbc46345c8cf46c5fcf48685c63eb9fbdd694ca00941ba5d5a43b103f2dc156c0bb9e2'
        '48678eca5b87a0b59038c8b343d84073207bca4390ad40ac81f2f96dc553cc66453f0f6331749d4686aa7153875bdaf2e08b2adf2bef023ee6044518955a7950')

package(){
    bsdtar -xf "data.tar.gz" -C "${pkgdir}"

    install -D -m 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    sed -i 's/Categories=/Categories=Utility;/g' "${pkgdir}/usr/share/applications/Handy.desktop"
}
