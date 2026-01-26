# Maintainer: czyt <czytcn@gmail.com>
pkgname=confirmo-bin
pkgver=1.0.26
pkgrel=1
pkgdesc="Your AI coding companion that lives on your desktop"
arch=('x86_64')
url="https://confirmo.love"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: for system tray icon support')
source=("confirmo_${pkgver}_amd64.deb::https://updates.confirmo.love/confirmo_${pkgver}_amd64.deb")
md5sums=('aec8c2a4c36704f3ff1e882b99223959')

package() {
    # Extract the deb package
    bsdtar -xOf "${srcdir}/confirmo_${pkgver}_amd64.deb" data.tar.xz | bsdtar -xC "${pkgdir}"

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}"
}
