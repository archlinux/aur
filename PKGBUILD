# Maintainer: czyt <czytcn@gmail.com>
pkgname=cumora-bin
pkgver=0.18.5
pkgrel=1
pkgdesc="A workspace where AI teammates live, not visit."
arch=('x86_64')
url="https://cumora.ai"
license=('unknown')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: for system tray icon support')
source=("cumora_${pkgver}_amd64.deb::https://updates.cumora.ai/cumora_${pkgver}_amd64.deb")
md5sums=('83c2348378f4b18fd4ec710870ad4741')

package() {
    # Extract the deb package
    bsdtar -xOf "${srcdir}/cumora_${pkgver}_amd64.deb" data.tar.xz | bsdtar -xC "${pkgdir}"

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}"
}
