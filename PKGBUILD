# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=nxshell
pkgname="${_pkgname}-bin"
pkgver=1.9.3
pkgrel=1
pkgdesc="An easy to use new terminal."
arch=('x86_64')
url="https://nxshell.github.io/"
_githuburl="https://github.com/nxshell/nxshell"
license=('MIT')
options=()
providers=("${_pkgname}")
conflicts=("${_pkgname}")
depends=(at-spi2-core alsa-lib nodejs-lts-fermium gtk3 nss python)
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/NxShell-amd64-linux-${pkgver}-202303220832.deb"
    "LICENSE::${_githuburl}/raw/main/LICENSE")
sha256sums=('3f32cfb803930aee09660dad0aa156beabb8f910b76fdaca6ebfb25ed5d2d6be'
            '66cb6bb15c338de5a7aa8356fd76f3db92151ef80405bcfeb573b7d39f9333ce')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}