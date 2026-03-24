# Maintainer: taotieren <admin@taotieren.com>

pkgbase=openixsuit-bin
pkgname=openixsuit-bin
_pkgname=OpenixSuit
pkgver=0.3.15
pkgrel=5
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
optdepends=(
    "openiximg: A comprehensive toolset for handling Allwinner IMAGEWTY format firmware images"
    "openixcli: Open Source CLI Tools for Flash Allwinner Firmware to Devices"
)
provides=(${pkgname%-bin} openixcard sunxi-livesuite)
conflicts=(${pkgname%-bin} openixcard sunxi-livesuite)
replaces=(sunxi-livesuite)
pkgdesc="Tools to Flash Allwinner Firmware to Devices like PhoenixSuit and LiveSuit"
license=('LicenseRef-scancode-commercial-license')
url="https://github.com/YuzukiTsuru/OpenixSuit"
source=("${url}/releases/download/v${pkgver}/${_name}.deb")
sha256sums=('327138ca4ed1883783e3f959114911f2997a06fc112981d4d1c02a66c19bfe9e')
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
