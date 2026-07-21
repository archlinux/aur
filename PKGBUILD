# Maintainer: imnaK <yama@tyrem-envalura.de>
pkgname=proton-drive-cli-bin
pkgver=0.6.0
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
sha512sums_aarch64=('4651d7b23d111a940d5a0d308a62aaf7d39f0d6a8ceba4c6faa2bcd69624557e0eb19f5a528e8d759fb1fcd96c9e094777fabdd218372dee563c6712bd13cdde')
sha512sums_x86_64=('e77f5b27a51a81063c23c15ac0a9f07e0ec5c868e78670f34b45b3c3c2e679ed769e6225796b900d0d02735a0c52a21eba72356f3ad617de076c405532e698dc')

package() {
    install -Dm755 "${srcdir}/proton-drive-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/proton-drive"
}
