# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Mark Collins

pkgname="handy-bin"
pkgver=0.9.6
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
    "gtk-layer-shell"
    "hicolor-icon-theme"
    "libappindicator-gtk3"
    "libsoup3"
    "openblas"
    "openssl"
    "vulkan-icd-loader"
    "webkit2gtk-4.1"
)
source=("${pkgname}-${pkgver}.deb::https://github.com/cjpais/Handy/releases/download/v${pkgver}/Handy_${pkgver}_amd64.deb"
        "https://raw.githubusercontent.com/cjpais/Handy/refs/heads/main/LICENSE")
b2sums=('eea9e5eba5abe6a40b0c2348a4d9343d195e12d6894d4873e96466a55a7f59c8e3bcf071086adb0207a5dec53728301e73a655dc9bf1f80c9d950f22f33c7f02'
        '48678eca5b87a0b59038c8b343d84073207bca4390ad40ac81f2f96dc553cc66453f0f6331749d4686aa7153875bdaf2e08b2adf2bef023ee6044518955a7950')

package() {
    bsdtar -xf "data.tar.gz" -C "${pkgdir}"

    install -D -m 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    sed -i 's/Categories=/Categories=Utility;/g' "${pkgdir}/usr/share/applications/Handy.desktop"
}
