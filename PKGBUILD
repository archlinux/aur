# Maintainer: Caitlyn Williams <caitlyn dot williams at proton dot me>
pkgname=pic32prog-bin
pkgver=2.1.56
pkgrel=1
pkgdesc="Flash programming utility for Microchip PIC32 microcontrollers"
arch=('x86' 'x86_64' 'armv7h')
url="https://github.com/majenkotech/pic32prog-autotools"
license=('GPL-2.0-or-later')
depends=('libusb')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('strip' '!libtool' '!staticlibs' '!emptydirs')

source_x86_64=("${pkgname%-bin}_x86_64_${pkgver}.tar.gz::${url}/releases/download/${pkgver}/pic32prog-debian-64-${pkgver}.tar.gz")
source_x86=("${pkgname%-bin}_x86_${pkgver}.tar.gz::${url}/releases/download/${pkgver}/pic32prog-debian-32-${pkgver}.tar.gz")
source_armv7h=("${pkgname%-bin}_aarch32_${pkgver}.tar.gz::${url}/releases/download/${pkgver}/pic32prog-debian-armhf-${pkgver}.tar.gz")

package() {
    install -dm755 "${pkgdir}/usr/bin/"
    cp -v "${srcdir}/pic32prog/pic32prog" "${pkgdir}/usr/bin/"
}

sha256sums_x86=('42f3f63bc22fee67ed9a1443e560279c5f3da14d8cc483458eb2579562952608')
sha256sums_x86_64=('a0c3053877d0034f7b42c439fe7f34c30a05f065bc54102b80c316ff0e217395')
sha256sums_armv7h=('b1d486a7f7dae16f3ca0b6672a5c2f2dee7610aaf024670ed91724a7151eedbe')
