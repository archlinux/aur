# Maintainer: imnaK <yama@tyrem-envalura.de>
pkgname=proton-drive-cli-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Official Proton Drive command-line client (precompiled binary)"
arch=('aarch64' 'x86_64')
url="https://proton.me/download/drive/cli/index.html"
license=('LicenseRef-proprietary')
provides=('proton-drive-cli' 'proton-drive')
conflicts=('proton-drive-cli')
options=('!strip' '!debug' '!lto')  # ship upstream binary untouched
source_aarch64=("proton-drive-${pkgver}-aarch64::https://proton.me/download/drive/cli/${pkgver}/linux-arm64/proton-drive")
source_x86_64=("proton-drive-${pkgver}-x86_64::https://proton.me/download/drive/cli/${pkgver}/linux-x64/proton-drive")
sha512sums_aarch64=('2c9768fde757d72c6df0554236f3dcdc84c8f5db4818fd35201705ae78c93795b9cba236d5e79d5bf723c549779b8b28987ae61039b05f33583e2c3052558d60')
sha512sums_x86_64=('fdf618d986c822773c8e8d00c412c2d4fab4d8d3a18aaf7cddd2d894acd2334ae622c52c916d317dbda9762b44e0692fbed8f63e0ba6548a735cd70fdd2f0d28')

package() {
    install -Dm755 "${srcdir}/proton-drive-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/proton-drive"
}
