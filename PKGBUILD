# Maintainer: taotieren <admin@taotieren.com>

pkgname=vlc-protocol
pkgver=1.3.6
pkgrel=1
epoch=
pkgdesc="VLC Protocol Handler - - Support vlc:// protocol links"
arch=('any')
url="https://github.com/northsea4/vlc-protocol"
license=('GPL-3.0-or-later')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    sh
    xdg-utils
    vlc)
makedepends=(libarchive)
optdepends=('firefox: Fast, Private & Safe Web Browser'
    'chromium: A web browser built for speed, simplicity, and security '
    'google-chrome: The popular web browser by Google (Stable Channel)')
backup=()
options=('!strip' '!debug')
install=${pkgname}.install
source=(
    "${pkgname}.install"
    "${pkgname}-linux-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname}-linux.zip")
sha256sums=('879e060df1bcb21837ba452f90f75c49f2952a64a4ea66b1d8444b4029ad10f2'
            'c3dde17f6e27ef6f725f4c20d3ba8707c526a49e369c4d2c5f2331b94d02daa1')
noextract=(
    ${pkgname}-linux-${pkgver}.zip)

package() {
    cd ${srcdir}
    mkdir -pv ${pkgname}-linux-${pkgver}
    bsdtar -xf "${pkgname}-linux-${pkgver}.zip" -C ${srcdir}/${pkgname}-linux-${pkgver}

    install -Dm755 "${srcdir}"/${pkgname}-linux-${pkgver}/vlc-protocol -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}"/${pkgname}-linux-${pkgver}/vlc-protocol.desktop -t "${pkgdir}/usr/share/applications/"
}
