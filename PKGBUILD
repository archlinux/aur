# Maintainer: imnaK <yama@tyrem-envalura.de>
pkgname=proton-drive-cli-bin
pkgver=0.8.0
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
sha512sums_aarch64=('27a1aec1d2095fd4a1a81e1d47cd1f9fd4901bd579ffe50342d15e2e52078d6e8b2dddcf58a4a386438dc7562017778be26c1ba62399f901ae82c7430e2140a3')
sha512sums_x86_64=('cf61c2688c45e1055d8add6221d9471a5a5b64bf3bcdb86460f5cb18414596cc4df3cdb6627c9097c94bec32a3c9915ada3211ef2ae5be33c46ebbc996ccaa28')

package() {
    install -Dm755 "${srcdir}/proton-drive-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/proton-drive"
}
