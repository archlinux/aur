# Maintainer: taotieren <admin@taotieren.com>

pkgbase=openixcli-bin
pkgname=openixcli-bin
_pkgname=${pkgname%-bin}
pkgver=0.2.1
pkgrel=1
arch=('x86_64')
_name=${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu
options=(!strip !debug)
depends=(
    hicolor-icon-theme
    libgcc_s.so
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
sha256sums=('bb64763ffee7b27e7f2b43a4019d1c70786759dea374b1abd5edcab6413795a1')
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
