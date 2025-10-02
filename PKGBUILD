# https://www.virustotal.com/gui/file/197d55819c9a54085b31c94f8c3f8d395a1f4c8ceff794a606ce5aee3a0f9248
pkgname=unraid-usb-creator-bin
pkgver=1.0
pkgrel=1
pkgdesc="A tool to create bootable USB drives for Unraid"
url="https://unraid.net"
arch=('x86_64')
license=('custom')
depends=(glibc  curl  libcurl-gnutls  hicolor-icon-theme  libarchive  openssl  qt5-base qt5-declarative  qt5-quickcontrols2  qt5-svg  zlib)
optional=(udisks2)
provides=(unraid-usb-creator)
source=(
    "https://releases.unraid.net/dl/stable/usb-creator.deb"
)

sha256sums=('197d55819c9a54085b31c94f8c3f8d395a1f4c8ceff794a606ce5aee3a0f9248')
sha512sums=('83d43788ca4082c91e06fcb0fe24453364ef9b0dab832286bbbfd93bcb7f0e6e0ae7553a5b07aa4fc910471d2bc5a6bb3f6b53b83a6c393dfe2b46aa2e19537f')
prepare() {
    echo "Preparing Unraid USB Creator"
    ar x "${srcdir}/usb-creator.deb"
    tar -xf data.tar.* -C "${srcdir}"
}
package (){
    echo "Packing Unraid USB Creator..."
    cp -r "${srcdir}/usr" "${pkgdir}/"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 ${srcdir}/usr/share/doc/unraid-usb-creator/copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}