# Maintainer: kregonia <jiangchenglu2004@gmail.com>

pkgname=babry-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Smart boundary-aware screenshot tool for Linux Wayland and X11"
arch=('x86_64')
url="https://github.com/kregonia/babry"
license=('Apache-2.0')
depends=('fontconfig' 'libxkbcommon' 'wayland' 'wl-clipboard')
optdepends=('libnotify: desktop notifications'
            'libsystemd: KDE/systemd integration'
            'zenity: save-as dialog for pinned images'
            'kdialog: save-as dialog for pinned images')
provides=('babry')
conflicts=('babry')
source_x86_64=("${pkgname}-${pkgver}::https://github.com/kregonia/babry/releases/download/v${pkgver}/babry-amd64-linux-v${pkgver}")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/kregonia/babry/v${pkgver}/LICENSE")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('c184b58729d2e28a8d4ebe100c598b8d8e8180918cd558a1fc14fb25a0323867')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/babry"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
