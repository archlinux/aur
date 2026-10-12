# Maintainer: imnaK <yama@tyrem-envalura.de>
pkgname=proton-drive-cli-bin
pkgver=0.9.0
pkgrel=2
pkgdesc="Official Proton Drive command-line client (precompiled binary)"
arch=('aarch64' 'x86_64')
url="https://proton.me/download/drive/cli/index.html"
license=('MIT')
depends=('libsecret' 'org.freedesktop.secrets')
provides=("proton-drive-cli=${pkgver}" 'proton-drive')
conflicts=('proton-drive-cli')
options=('!strip' '!debug' '!lto')
source=("LICENSE-${pkgver}.md::https://raw.githubusercontent.com/ProtonDriveApps/sdk/cli/v${pkgver}/LICENSE.md")
source_aarch64=("proton-drive-${pkgver}-aarch64::https://proton.me/download/drive/cli/${pkgver}/linux-arm64/proton-drive")
source_x86_64=("proton-drive-${pkgver}-x86_64::https://proton.me/download/drive/cli/${pkgver}/linux-x64/proton-drive")
sha512sums=('b568865e91743da34047bae278273cd3950826e940ec7ff15033dd35f5f4687f097a425b8cc5679e9a201524c1e45ec043e292cda6fa0ad1c6c480055afef2ad')
sha512sums_aarch64=('c8d5a6b174e57f06d05cb5483400b9963faf58e743b6b33706bb73ecff718047ffce6b439994255b94b5b226b90d2e91bef7418ec96c1c3f5d8bf39b6cd01321')
sha512sums_x86_64=('3533025ba69ae112b64e3e01fbcc1ad0688136a4043f6cf6a72886967d85fdcd9ec235479c2e113171614be5225bfba93427509a05ca5aa6071d924fa7e91ca8')

package() {
    install -Dm755 "${srcdir}/proton-drive-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/proton-drive"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
