# Maintainer: jmcb <joelsgp@protonmail.com>
# Contributor: Marc Mettke <mettke@itmettke.de>

pkgname='jetbrains-mps'
pkgver='2022.3'
pkgrel=1
pkgdesc="JetBrains Meta Programming System"
arch=('any')
url="http://www.jetbrains.com/mps/index.html"
license=('custom: MPS license agreement')
depends=('java-environment=17' 'libxslt' 'gtk2' 'libglvnd' 'libxtst' 'alsa-lib' 'python')
optdepends=('ffmpeg0.10: support for multimedia plugin')

source=("https://download.jetbrains.com/mps/${pkgver}/MPS-${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('6a8640ef9613fa562513788ae33d66c535ec230564d000cea61f7684a2f4042b'
            'b948bf480e88f47776374dadcdac3da1890b0825e858ec5170c7aba6b8b9218f')

package() {
    mkdir -p "${pkgdir}/opt/"
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

    mv "${srcdir}/MPS ${pkgver}" "${pkgdir}/opt/${pkgname}"
    install -m 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    ln -s "/opt/${pkgname}/license/mps_license.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
