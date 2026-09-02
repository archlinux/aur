# Maintainer: czyt <czytcn@gmail.com>
pkgname=cumora-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="A workspace where AI teammates live, not visit."
arch=('x86_64')
url="https://cumora.ai"
license=('unknown')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: for system tray icon support')
source=("cumora_${pkgver}_amd64.deb::https://updates.cumora.ai/cumora_${pkgver}_amd64.deb")
md5sums=('8a6b562299ed32b219666b77534f954c')

package() {
    # Extract the deb package
    bsdtar -xOf "${srcdir}/cumora_${pkgver}_amd64.deb" data.tar.xz | bsdtar -xC "${pkgdir}"

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}"
}
