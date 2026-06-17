# Maintainer: taotieren <admin@taotieren.com>

pkgbase=openixcli-bin
pkgname=openixcli-bin
_pkgname=${pkgname%-bin}
pkgver=0.1.7
pkgrel=1
arch=('x86_64')
_name=${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu
options=(!strip !debug)
depends=(
    glibc
    hicolor-icon-theme
    libgcc
    libusb
)
makedepends=(libarchive)
optdepends=(
    "openixcard: Open Source Version of Allwinner PhoenixCard on Linux"
    "openiximg: A comprehensive toolset for handling Allwinner IMAGEWTY format firmware images"
    "openixsuit: Tools to Flash Allwinner Firmware to Devices like PhoenixSuit and LiveSuit"
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
replaces=()
pkgdesc="Open Source CLI Tools for Flash Allwinner Firmware to Devices"
license=('MIT')
url="https://github.com/YuzukiTsuru/OpenixCLI"
source=("${url}/releases/download/v${pkgver}/${_name}.deb")
sha256sums=('2c25f70e564ba56828c18771d6c1e5e6f43f2a5ad4fffbd8c796f9b83ae2094b')
# noextract=()

# prepare() {
#     mkdir -pv ${srcdir}/${pkgname}-${pkgver}
#     bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" --numeric-owner -C "${srcdir}/${pkgname}-${pkgver}"
# }

package() {
    # cd ${srcdir}/${_name}
    bsdtar -xf "${srcdir}/data.tar.xz" --numeric-owner -C "${pkgdir}/"
    # install -Dm644 license -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
