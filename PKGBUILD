# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=minetime
pkgver=1.4.2
pkgrel=1
pkgdesc='MineTime is a modern, intuitive and smart calendar application.'
arch=('x86_64')
url='https://github.com/marcoancona/MineTime'
license=()
depends=()
source=(${url}/releases/download/v${pkgver}/MineTime_${pkgver}_amd64.deb
        minetime)
sha512sums=('7cd9c380343f1877c0080aa0ded67d85b87e742c35eb527862f76a81d99d8de4a658e591b29c04fd3826554752ca4e0e977549f1932fd16693f8ddac18abe6a9'
            '0e920e108134b6248ac23b72de2ae5940cd8c1b25bd4e9629c36f168cdd763abf9adb2b0ea45bbec2ccdcfe537fee83a694338a8f5eeb68b6963774b06072cec')

package() {
    cd "${srcdir}"
    tar -xJC "${pkgdir}" -f data.tar.xz

    # Create /usr/bin for the executable
    mkdir "${pkgdir}/usr/bin"
    install -m 755 "${startdir}/minetime" "${pkgdir}/usr/bin/minetime"
}
