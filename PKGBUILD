# Maintainer: imnaK <yama@tyrem-envalura.de>
pkgname=proton-drive-cli-bin
pkgver=0.4.4
pkgrel=1
pkgdesc="Official Proton Drive command-line client (precompiled binary)"
arch=('aarch64' 'x86_64')
url="https://proton.me/download/drive/cli/index.html"
license=('LicenseRef-proprietary')
depends=('libsecret')
optdepends=('gnome-keyring: Secret Service backend for credential storage'
            'kwallet: KDE Secret Service backend'
            'keepassxc: Secret Service backend')
provides=("proton-drive-cli=${pkgver}" 'proton-drive')
conflicts=('proton-drive-cli')
options=('!strip' '!debug' '!lto')
source_aarch64=("proton-drive-${pkgver}-aarch64::https://proton.me/download/drive/cli/${pkgver}/linux-arm64/proton-drive")
source_x86_64=("proton-drive-${pkgver}-x86_64::https://proton.me/download/drive/cli/${pkgver}/linux-x64/proton-drive")
sha512sums_aarch64=('809b50357ea6ea01492ef68c101b17ce09393276d5058081b3864b696aec99f6830f9be357a37e895ba5c101c1a8c43884395a0422ea9b30cd3ec6c1bee39c2a')
sha512sums_x86_64=('7ae6700ddd4479c976a787bba46dd610b0037c5b17bd71f06519ced9af6ddf75e7b9d9b7f87ad2daf8be981b7ac072960c5855b23429a1442fc8f389707ede6e')

package() {
    install -Dm755 "${srcdir}/proton-drive-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/proton-drive"
}
