# Maintainer: imnaK <yama@tyrem-envalura.de>
pkgname=proton-drive-cli-bin
pkgver=0.4.6
pkgrel=1
pkgdesc="Official Proton Drive command-line client (precompiled binary)"
arch=('aarch64' 'x86_64')
url="https://proton.me/download/drive/cli/index.html"
license=('LicenseRef-proprietary')
depends=('libsecret' 'org.freedesktop.secrets')
provides=("proton-drive-cli=${pkgver}" 'proton-drive')
conflicts=('proton-drive-cli')
options=('!strip' '!debug' '!lto')
source_aarch64=("proton-drive-${pkgver}-aarch64::https://proton.me/download/drive/cli/${pkgver}/linux-arm64/proton-drive")
source_x86_64=("proton-drive-${pkgver}-x86_64::https://proton.me/download/drive/cli/${pkgver}/linux-x64/proton-drive")
sha512sums_aarch64=('92b48ccb82f6480759aba1021546ab487c2baef93c985a2fd362d5a5766933268cd039c546786efc641b5c2cdb600c1211e1d92f343059676b8461bb21d47117')
sha512sums_x86_64=('d187409932742e6fdc6aae2995998f4c89ea51999283395bc8d0bdc5343a79d31bf5a485d5af9adf3b7909fc92f2d2ef0b133edc4939d5faf1d096eb744425bb')

package() {
    install -Dm755 "${srcdir}/proton-drive-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/proton-drive"
}
