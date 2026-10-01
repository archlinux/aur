# Maintainer: Herbert Knapp
pkgname=openarena-omega-engine-bin
pkgver=3.4.1
pkgrel=1
pkgdesc="An unofficial fork of the Quake3e engine for OpenArena"
arch=('x86_64')
url="https://github.com/Bishop-333/OmegA-engine"
license=('GPL-2.0-or-later')
depends=('openarena')
optdepends=('vulkan-driver: Run vulkan renderer')
makedepends=('unzip')
source=("https://github.com/Bishop-333/OmegA-engine/releases/download/v${pkgver}/omega-engine-linux-x86_64.tar.gz"
    'openarena-omega'
    'openarena-omega.desktop'
    'openarena-omega-vulkan.desktop'
    'openarena-omega.png'
)
sha256sums=('53f300323df607530693b3d1f08d5887f13842ce4bd6f361b079bc060c289b1a'
    'fdbc32d33962b508728e0c52147a90dae340270efa57c421c9811d89a92b3e31'
    'a6aa64945ca74e073e48926a201e6c0ee21f7ccdf689e2a08abe981e62a11016'
    '857b5c18e37a3bbf866feb3a69c8b0461d5b50643205fd1620412c59751ed9d0'
    '942e791410a95268251a144494d09fa9f6555e847880f12ee802587aa50f4972')

prepare() {
unzip -o omega-engine-linux-x86_64.zip -d "${srcdir}/omega-engine"
mkdir -p "${pkgdir}/usr/share/pixmaps"

}

package() {
cd "${srcdir}/omega-engine/release-linux-x86_64"

install -Dm755 omega-vulkan-x64 "${pkgdir}/usr/bin/omega-vulkan-x64"
install -Dm755 omega-x64 "${pkgdir}/usr/bin/omega-x64"
install -Dm755 "$srcdir"/openarena-omega "${pkgdir}/usr/bin/openarena-omega"

install -Dm644 "$srcdir"/openarena-omega.png "$pkgdir"/usr/share/pixmaps/openarena-omega.png
install -Dm644 "$srcdir"/openarena-omega.desktop "$pkgdir"/usr/share/applications/openarena-omega.desktop
install -Dm644 "$srcdir"/openarena-omega-vulkan.desktop "$pkgdir"/usr/share/applications/openarena-omega-vulkan.desktop
}
