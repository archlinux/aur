# Maintainer: imnaK <yama@tyrem-envalura.de>
pkgname=proton-drive-cli-bin
pkgver=0.4.5
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
sha512sums_aarch64=('851b87f64938af6dbeffffaf2264c3ea94733b9bd5f6890546307f185ed6ce81c278bd59d0d83ca75f861d44bcb37953ca993ff2a6696c08842429e6c076e282')
sha512sums_x86_64=('e84ef7b37865e290519b4f89eecf064f81d1fd838cd0f56b1dcf8cc57c73a1560fe789ee79f4583cbeceea51664904fd038930798aeb8f34e7b9c38ef06c3612')

package() {
    install -Dm755 "${srcdir}/proton-drive-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/proton-drive"
}
