# Maintainer: NicoHood <aur {at} nicohood {dot} de>

pkgname=arduino-docs
pkgver=1.6.6
pkgrel=3
pkgdesc="Arduino IDE reference documentation"
arch=('any')
url="https://www.arduino.cc/"
license=('CCPL')
depends=('')
makedepends=('')
optdepends=('arduino: Arduino IDE')
options=(!strip)
source=("https://downloads.arduino.cc/reference-1.6.6-3.zip"
        "https://downloads.arduino.cc/Galileo_help_files-1.6.2.zip"
        "https://downloads.arduino.cc/Edison_help_files-1.6.2.zip")
sha512sums=('65962322b6dcb15da6c119d47c382052d1183772c855b8e8fcdd108b54e730e2374d93741737f3b51e57288a0e8842a6a7f79dce4377ea3630293e6c3e7e8b73'
            '411fcfad9e9877078de62c02accd66ed5e44daf2979cad38c12962c22d73412d084670db77d5b50b3a32f35977961943e90d85ac80484f926468aa994f8b107b'
            '63d4005036b43f09347814433578e8c75a7af5caa0923516deab146ef0867af4e60aad0c9d5d47870dcec0ddb4e5396363e4312425f95a8d8da8725f77da8f3a')

prepare() {
    # Delete all links to source .zip files
    find "${srcdir}" -maxdepth 1 -type l -exec rm -f {} \;

    # Fix folder permissions of downloads
    find "${srcdir}" -type d -exec chmod 755 {} \;
}

package() {
    # Create directory
    install -dm755 "${pkgdir}/usr/share/doc/arduino"

    # Copy docs
    cp -a . "${pkgdir}/usr/share/doc/arduino"
}
