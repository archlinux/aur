# Maintainer: taotieren <admin@taotieren.com>

pkgbase=openixsuit-bin
pkgname=openixsuit-bin
_pkgname=OpenixSuit
pkgver=0.3.12
pkgrel=1
arch=('x86_64')
_name=${_pkgname}_${pkgver}_amd64
options=(!strip !debug)
depends=(
    cairo
    gdk-pixbuf2
    glib2
    glibc
    gtk3
    hicolor-icon-theme
    libgcc
    libsoup3
    libusb
    webkit2gtk-4.1
)
makedepends=(libarchive)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
replaces=()
pkgdesc="Tools to Flash Allwinner Firmware to Devices like PhoenixSuit and LiveSuit"
license=('LicenseRef-scancode-commercial-license')
url="https://github.com/YuzukiTsuru/OpenixSuit"
source=("${url}/releases/download/v${pkgver}/${_name}.deb")
sha256sums=('9c80ca2ee07c9a84aeadea8b59b1ec6871b45342f896cd558635d3c2f8852900')
# noextract=()

# prepare() {
#     mkdir -pv ${srcdir}/${pkgname}-${pkgver}
#     bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" --numeric-owner -C "${srcdir}/${pkgname}-${pkgver}"
# }

package() {
    # cd ${srcdir}/${_name}
    bsdtar -xf "${srcdir}/data.tar.gz" --numeric-owner -C "${pkgdir}/"
    # install -Dm644 license -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
